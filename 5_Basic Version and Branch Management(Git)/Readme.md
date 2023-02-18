# (5)Basic Version and Branch Management(Git)
---
version
revisi dari code- code program yang sudah kita buat, bisa juga untuk memperbaharui atau mengoptimasi 

tools dalam melakukan revisii
version control system(vcs)
Source Code Manager(SCM)
Revision Control System(RCS)

Git VCS yang biasa dipakai developer untuk mengembangkan software bersama-sama atau kolaborasi

github = git hosting service 

sistem kerja git
kita membuat working directory
mengetik git add pada terminal lalu git commit untuk memperbaharui working directory

## Tools tools pada git

* git config menghubungkan github dengan git
* git clone untuk melakukan clone repository
* git init untuk membuat repository yang ada di file local
* git status untuk melakukan check perubahan yang terjadi
* git add menambahkan file ke dalam local repository
* git commit sebagai save point perubahan biasanya akan terdapat commit message
* git stash menyimpan pekerjaan yang belum selesai di commit
* git checkout untuk merubah branch
* git push untuk mengirim file dari local repository ke repository jauh
* git merge untuk melakukan merge branch

terdapat file .gitignore file yang isinya nama-nama file dan direktori yang diabaikan oleh git  

### workflow untuk lebih baik di bentuk dalam beberapa branch 
Master
    |--> Development
		|
		Feature A
		|
		Feature B 

