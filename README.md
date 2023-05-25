Sync a file to a Git repository (such as GitHub Gist) periodically.

![](https://i.imgur.com/VaudKyG.jpg)

<br>

Say you are running a program on a remote computer that outputs a file, and you want to share that file with others. You could use a service like [GitHub Gist](https://gist.github.com/) to share the file, but you would have to manually update the file every time it changes. This program automates that process.

```bash
$ bash index.sh "<repo-url>" "<file>" "[path-in-repo=file]" "[delay=1m]"
# "<repo-url>": URL of the Git/Gist repository
# "<file>"    : Path to the file to sync
# "[path-in-repo]": Path to the file in the repository (default: same as "<file>")
# "[delay]"       : Delay between syncs (default: 1 minute)
```
