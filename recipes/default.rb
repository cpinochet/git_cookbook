#
# Cookbook:: git_cookbook
# Recipe:: default
#
# Copyright:: 2023, The Authors, All Rights Reserved.

if platform?('redhat', 'centos')
    script 'fix_repo_list' do
        interpreter "bash"
        code <<-EOH
        cd /etc/yum.repos.d/
        sudo sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
        sudo sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*
        sudo yum update -y        
        EOH
        live_stream true
    end      
end

package 'git'
