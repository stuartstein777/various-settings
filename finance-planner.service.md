# To add

1. `$ sudo emacs /etc/systemd/system/finance-planner.service`
2. Paste in contents below
```
[Unit]                                                                                                                                                                                 
Description=Finance Planner Backend
After=network.target

[Service]
Type=simple
ExecStart=/home/stuart/.dotnet/dotnet /home/stuart/finance-planner/be/FinancePlannerBackend.dll --urls="http://localhost:7229"
WorkingDirectory=/home/stuart/finance-planner/be/
Restart=on-failure
User=stuart
Environment=DOTNET_ENVIRONMENT=Production

[Install]
WantedBy=default.target
```
4. Make it run on startup

```
$ sudo systemctl daemon-reload
$sudo systemctl enable finance-planner.service
```
5. Start the service now
`$ sudo systemctl start finance-planner.service`
6. Check its status

```
$ systemctl status finance-planner.service
$ journalctl -xeu finance-planner.service
```

