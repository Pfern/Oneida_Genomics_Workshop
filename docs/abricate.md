# Using ABRicate to identify antibiotic resistance genes

---

* [_ONEIDA - Genomics Workshop_](./ONEIDA_Workshop_Program.md)
    * [_INNUCA: a genome assembly pipeline_](./innuca.md)
    * [_Genome annotation with Prokka_](./prokka.md)
    * _Using ABRicate to identify antibiotic resistance genes_
        1. [_Find ARGs_](./abricate.md#find-args)

---

## Find ARGs

### Abricate

**_What is [Prokka](https://github.com/tseemann/prokka)?_**  

> Prokka is a software tool to annotate bacterial, archaeal and viral genomes quickly and produce standards-compliant output files

### Annotate antibiotic resistance genes

Typing with Abricate using Resfinder DB

```bash
# Create folder to store Abricate outputs
export prokka_dir=~/genomes/streptococcus_agalactiae/prokka
export abricate_dir=~/typing/streptococcus_agalactiae/abricate

mkdir -p $abricate_dir

# Run Abricate for each sample
## List all produced assemblies and pass to parallel
### Run Docker without TTY (-t option)
### Map the assemblies folder in /data/ folder and the updated Abricate DB in Docker Abricate DB folder
### Redirect the Abricate output to a file named as the assembly but without the extension (using {/.})
### Note that the redirection should be done using filesystem paths outside the container
ls ~/genomes/streptococcus_agalactiae_example/all_assemblies/* | \
      parallel --jobs 8 'docker run --rm -u $(id -u):$(id -g) -v ~/genomes/streptococcus_agalactiae_example/all_assemblies/:/data/ -v /media/volume/DBs/abricate/:/NGStools/miniconda/db/ ummidock/abricate:latest abricate --db resfinder /data/{/} > /media/volume/typing/streptococcus_agalactiae_example/abricate/{/.}.abricate_out.tab'

# Summarize all Abricate results into a single file
## With Docker, when using * to refer multiple files, the paths obtained refer to the filesystem outside the container
## Therefore, a shell script file is created containing the command to be run inside the container
## Note that the command inside the shell script only contains paths refering to mapped folder /data/
echo 'abricate --summary /data/*.abricate_out.tab > /data/abricate_summary.resfinder.tab' > /media/volume/typing/streptococcus_agalactiae_example/abricate/abricate_commands.sh
## Run the summary Abricate command
docker run --rm -u $(id -u):$(id -g) -it -v /media/volume/typing/streptococcus_agalactiae_example/abricate/:/data/ -v /media/volume/DBs/abricate/:/NGStools/miniconda/db/ ummidock/abricate:latest \
      sh /data/abricate_commands.sh
```
