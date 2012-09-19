# This filebench script is used to verify that the seed of randvar is working
# properly. Run the script and see if the I/O done by readfile0 and readfile1 is 
# the same when given the same seed. And they are different from readfile2 which
# is using a different seed.
define fileset name=bigfileset,path=testdir,size=16k,entries=1000,dirwidth=1000,prealloc=100

echo "testing randvar"
define randvar name=$fileidx1, type=gamma, seed=17, mean=250, gamma=50000, min=0, randsrc=rand48
define randvar name=$fileidx2, type=gamma, seed=17, mean=250, gamma=50000, min=0, randsrc=rand48
define randvar name=$fileidx3, type=gamma, seed=71, mean=250, gamma=50000, min=0, randsrc=rand48

define process name=mailserver,instances=1
{
  thread name=mailserverthread,memsize=10m,instances=1
  {
        flowop openfile name=openfile0,filesetname=bigfileset,fd=1,indexed=$fileidx1
        flowop readwholefile name=readfile0,fd=1,iosize=1m,directio
        flowop closefile name=closefile0,fd=1

        flowop openfile name=openfile1,filesetname=bigfileset,fd=1,indexed=$fileidx2
        flowop readwholefile name=readfile1,fd=1,iosize=1m,directio
        flowop closefile name=closefile1,fd=1

        flowop openfile name=openfile2,filesetname=bigfileset,fd=1,indexed=$fileidx3
        flowop readwholefile name=readfile2,fd=1,iosize=1m,directio
        flowop closefile name=closefile2,fd=1

  }
}

psrun -5 60
