## ssh复用连接配置

ssh支持复用连接，只要第一次登录跳板机，以后登录不需要再输入密码了，方便开发。

```
Host *
    KeepAlive yes
    ServerAliveInterval 60
    ControlMaster auto
    ControlPersist yes
    ControlPath ~/.ssh/socks/%h-%p-%r
```

## ssh交互式输入口令

如果设为“yes”，passphrase/password（交互式输入口令）的提示将被禁止

```
Host *
	BatchMode no 
```


## ssh自动把计算机的密匙加入$HOME/.ssh/known_hosts文件

如果设置成“yes”，ssh就不会自动把计算机的密匙加入$HOME/.ssh/known_hosts文件，并且一旦计算机的密匙发生了变化，就拒绝连接。

```
Host *
	StrictHostKeyChecking no
    # 取消记录密匙
    UserKnownHostsFile /dev/null
```
