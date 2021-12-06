cd ~ 
# optional. you may already have a src directory
mkdir src
cd ~/src
git clone https://github.com/samtools/htslib
git clone https://github.com/samtools/samtools
cd samtools
make
cp samtools ~/bin 

#create a new directory from your home directory called sametools-demo
cd ~
mkdir samtools-demo 
#download the example gzipped SAM file I have provided 
curl https://s3.amazonaws.com/samtools-tutorial/sample.sam.gz > sample.sam.gz
gzip -d sample.sam.gz 

#converting SAM to BAM using "samtools view  subcommand 
#in our commands it is required to specifiy our input format which will be SAM 
# -S stands for SAM inout format  , then specify the output format which is BAM 
# -b stands for the BAM format and finally the sign ">" is just a UNIX convension 
#we have nothing to do with UNIX convensions here . 
samtools view -S -b sample.sam > sample.bam 

#now we want to view the head of our converted sam file (The new bam file )
samtools view sample.bam | head  