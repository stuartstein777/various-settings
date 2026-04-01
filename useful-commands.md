# CLear old snaps

```bash
snap list --all | awk '/disabled/{print $1, $3}' | while read snapname revision; do
  sudo snap remove "$snapname" --revision="$revision"
done
```

# Only retain 2 versions of snaps

```bash
sudo snap set system refresh.retain=2
```


