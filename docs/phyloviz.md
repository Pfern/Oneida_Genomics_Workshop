# PHYLOViZ Online

---

PHYLOViZ Online is an online version of the software PHYLOViZ, a software that allows the analysis of sequence-based typing methods that generate allelic profiles and their associated epidemiological data.

### Presentation

A presentation regarding the features of the application can be found [here](https://docs.google.com/presentation/d/1s40Bh-XJuUzncwwuOiUbAZ8S-fBfBqKBeHxz-6oou5o/edit?usp=sharing)

## Usage steps

### Preparing the metadata files

To get some relevant additional data to associate with our trees, we will run abricate with the list of genomes used as input for the allele call task in chewBBACA.

```
#Get test_chewbbaca directory path
test_chewbbaca=$(find /home/participant/ -type d -name 'test_chewbbaca')

#Get abricate directory path
abricate_dir=~/oneida_workshop/typing/streptococcus_agalactiae/abricate

#Run abricate for each ncbi downloaded genomes
for ncbi_genomes in complete_genomes other_assemblies; do
  dir=$test_chewbbaca/$ncbi_genomes
  
  for sample in $(ls $dir/*.fna); do
    sample_name=$(basename $sample | rev | cut -f 2- -d '.' | rev)
    mkdir -p $abricate_dir/$sample_name
    abricate --db resfinder $dir/$sample > $abricate_dir/$sample_name/$sample_name.abricate_out.tab
  done
  
done

#Concatenate the abricate results of INNUca assembled genomes 
#with the abricate results of the ncbi downloaded genomes
abricate --summary $abricate_dir/*/*.abricate_out.tab > $abricate_dir/abricate_summary.resfinder.day1_day2.tab
```

After running the above commands, open the summary table and substitute the numeric values with what for you is **true** for presence of a resistence genes and **false** to absence.

Change the header of the IDs from #FILE to FILE and save the file as tab delimited. 

Alternatively you can download it directly [here]()

### Preparing the profile file

Get the profile file obtained from chewBBACA [task 5](https://github.com/Pfern/Oneida_Genomics_Workshop/blob/master/docs/chewbbaca.md#task-5---extract-the-profile-for-phyloviz)

As an option you can donwload the file directly from the repository [directory](https://raw.githubusercontent.com/Pfern/Oneida_Genomics_Workshop/master/docs/cgMLST.tsv).

### Accessing the application

For the purpose of this course, you can access to the online application at [http://137.205.70.78](http://137.205.70.78).
Use **Google Chrome** for a better user experience.

***Login***: oneida_workshop

***Password***: oneida_workshop

To acess the upload page, go to `Actions > Upload Data sets`.

Upload the profile file and metadata, choose ***core*** analysis and missing data as ***0***.

Click `Launch Tree` and Explore!

***NOTE***: You can perform subsets of the tree by pressing `shift+s` and dragging with the mouse over the nodes to select them. Them click on `Operations > Subset Operations > Create Subsets` and a popup will appear to create the subsets.

Metadata file [here]()
