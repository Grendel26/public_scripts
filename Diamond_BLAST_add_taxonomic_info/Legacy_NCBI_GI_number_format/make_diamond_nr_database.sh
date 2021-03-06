#!/bin/bash


# script to convert NR database to fasta files and make a diamond blastdatabse.


# to install diamond from source
#cd /path_to/Downloads/

#wget http://github.com/bbuchfink/diamond/archive/v0.7.9.tar.gz

#tar xzf v0.7.9.tar.gz

#cd diamond-0.7.9/src
# # optional, for installing Boost

##./install-boost 

#make
# 
 
#put the /bin in your PATH

cd /path_to/Downloads/blast_databases

export BLASTDB=/mnt/shared-new/cluster/blast/ncbi/extracted/

# can only use protein databases with this program.
blastdbcmd -entry 'all' -db nr > nr.faa

echo im making the nr fasta file

/path_to/Downloads/diamond-0.7.9/bin/diamond makedb --in nr.faa -d nr

echo nr fasta done
#diamond makedb --in /mnt/shared/cluster/blast/ncbi/extracted/uniprot_sprot.faa -d uniprot

#diamond makedb --in /mnt/shared/cluster/blast/ncbi/extracteduniref90.faa -d uniref90


#files required for pyhon script to get tax id and species name ..

echo im downloading files from NCBI

wget ftp://ftp.ncbi.nih.gov/pub/taxonomy/gi_taxid_prot.dmp.gz
gunzip gi_taxid_prot.dmp.gz

wget ftp://ftp.ncbi.nih.gov/pub/taxonomy/taxcat.zip
unzip taxcat.zip

wget ftp://ftp.ncbi.nih.gov/pub/taxonomy/taxdump.tar.gz
tar -zxvf taxdump.tar.gz

echo downloading and unzipping done

python ~/misc_python/diamond_blast_to_kingdom/prepare_gi_to_description_databse.py

echo single discription to gi number database done

#rm -rf nr.faa





