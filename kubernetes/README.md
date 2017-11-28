1、修改Vagrantfile中vm_num变量的数据值，改变量决定了集群中的节点数
``` bash
vm_num = 3
```
2、修改Vagrantfile中的box为自己的 centos7.x box
``` bash
node.vm.box = "bento/centos-7.4"
```
3、在Vagrantfile所在目录执行以下命令启动集群，集群节点启动过程中会自动安装并配置kubernetes相关组件
``` bash
vagrant up
```
4、等待集群启动完成之后登陆node-01节点，通过以下命令检查kubernetes集群几点是否正常，如果集群正常可以看到集群中的从节点
``` bash
vagrant ssh node-01
kubectl get node
```