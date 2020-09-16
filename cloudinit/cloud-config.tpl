#cloud-config
timezone: Pacific/Auckland
packages:
   - python3-pip
   - awscli
   - httpd
package_upgrade: false
write_files:
-   content: |
        OSS Lab web server for ${owner}
    path: /etc/motd
runcmd:
   - sudo pip3 install ansible