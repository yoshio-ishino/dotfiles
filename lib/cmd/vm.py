import subprocess
import sys

import fire
import paramiko


class VBoxManager(object):
    """This is simple Virtual Box manager. See supported method belows."""
    def __init__(self):
        self._image = 'CentOS7.6.1810-mini'
        self.version = 'version 1.1'

    def _exec_local_command(self, cmds):
        try:
            subprocess.check_call(cmds)
        except Exception as e:
            tb = sys.exc_info()[2]
            print('[ERROR]: {}'.format(e.with_traceback(tb)))

    def _exec_ssh_command(self, ip):
        cmds = ['sed -i "s|\(IPADDR=\).*|\\1{}|" /etc/sysconfig/network-scripts/ifcfg-enp0s8'.format(ip),
                'systemctl restart network']
        for command in cmds:
            stdin, stdout, stderr = self.client.exec_command(command)
        print("[INFO]: VM ip {} is successfully seted.".format(ip))
        self.client.close()


class VBoxManagerMethods(VBoxManager):
    def create(self, new_vmname):
        cmds = ['VBoxManage', 'clonevm', self._image,
                '--mode', 'machine', '--name', new_vmname, '--register']
        self._exec_local_command(cmds)

    def delete(self, target_vmname):
        cmds = ['VBoxManage', 'unregistervm', target_vmname, '--delete']
        self._exec_local_command(cmds)

    def start(self, target_vmname):
        cmds = ['VBoxManage', 'startvm', '--type', 'headless', target_vmname]
        self._exec_local_command(cmds)

    def off(self, target_vmname):
        cmds = ['VBoxManage', 'controlvm', target_vmname, 'poweroff']
        self._exec_local_command(cmds)

    def show_vms(self):
        cmds = ['VBoxManage', 'list', 'vms']
        self._exec_local_command(cmds)

    def show_run_vms(self):
        cmds = ['VBoxManage', 'list', 'runningvms']
        self._exec_local_command(cmds)

    def set_ip(self, ip):
        print("[INFO]: Setting VM ip...")
        host = '192.168.56.111'
        name = 'root'
        password = 'test'
        self.ip = ip
        self.client = paramiko.SSHClient()
        self.client.set_missing_host_key_policy(paramiko.AutoAddPolicy())
        self.client.connect(host, port=22, username=name, password=password)
        self._exec_ssh_command(self.ip)


if __name__ == '__main__':
    fire.Fire(VBoxManagerMethods)
