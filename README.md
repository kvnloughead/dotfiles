`1# Dotfiles Bare Repo

This is my second attempt at a dotfiles repo. The [first attempt](https://github.com/kvnloughead/dotfiles-homerepo) simply turned my $HOME directory into a repo with a `.gitignore` of `*`. This went ok, and I was able to set up a new computer with relative ease. But I kept running into issues with the setup, so I decided to go with another approach — a bare repo.

For more details about the issues I ran into in my first iteration, and an explanation of bare repos and their use in version-controlling your dotfiles, see my [blog post on the subject](https://www.kevinloughead.com/blog/bare-dotfiles-repo/).

## Basic Features

1. Collection of configuration files in `.config/`
2. Collection of aliases in `.aliases/`
3. An installation script, `.scripts/initial-install.sh`
4. A backup script, `.scripts/backup.sh`

## Setting up a new machine

These are the steps one would take to setup their dotfiles repo on a new machine. You could use them to try out this repo for yourself if you wanted to — just go through all the files and remove what you don't need. But I'd recommend taking a more DIY approach, following the initial setup instructions I give at the bottom of the page.

1. Clone repo as non-bare repository

   ```sh
   # Clones as non-bare repo, so you get all the files and not just the history
   git clone \
      --separate-git-dir=$HOME/.dotfiles \
      git@github.com:kvnloughead/dotfiles.git \
      dotfiles-tmp

   # --separate-git-dir places git history in ~/.dotfiles instead of `./.git`
   # Working tree will be placed in `./dotfiles`.
   ```

2. Copy the working tree to where each file should go.

   ```sh
   # I'm not sure if it is necessary to exclude `.git`.
   rsync --recursive --verbose --exclude '.git' dotfiles-tmp/ $HOME/
   ```

3. `rm -rf dotfiles-tmp`

4. (Linux only) Run the install script with `~/.scripts/initial-install.sh`. 

  This is a long list of commands that I've been compiling of programs that I figure I'll probably want on a new machine. I'd suggest pruning to suit your own needs. 

## Notes on Mac usage

To use Bash instead of Zsh I included the following in `.bash_profile`:

```sh
# Source .bashrc if it exists
if [ -f ~/.bashrc ]; then
   source ~/.bashrc
fi
```

I also changed the default shell with `chsh -s /bin/bash`. This way, `.bashrc` is sourced whenever you open a new terminal session. I'm not sure if changing the default shell is necessary.

After making these changes I needed to reinstall Homebrew and node in the new shell.

## Workflow

Once you have everything setup, the workflow is basically the same as with a normal repository.

```sh
dotgit add some-file
dotgit commit -m "message"
dotgit push origin main
```

The main difference is that it is somewhat trickier to manage file tracking.

## Initial Setup

Instructions for getting a new dotfiles bare repo setup. I'm relying heavily on an [article by Greg Owens](https://stegosaurusdormant.com/ bare-git-repo/#fnref:no-home-git-repo) for these instructions.

1. Create a new bare Git repo in `~/.dotfiles` to store the history for your dotfiles. Feel free to change the directory name.

   ```sh
   git init --bare $HOME/.dotfiles
   ```

2. Git commands won't work without the addition of a few flags. You should create an alias to save you a lot of typing. Feel free to change the alias — I'm using `dg`. Add this to `.bashrc` and run `source .bashrc`.

   ```sh
   alias dotgit='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

   # --git-dir tells git where the git history is
   # --work-tree tells git where working tree is
   ```

3. Ignore untracked files. I am torn between using this and adding a `.gitignore` with `*` in it the $HOME. Ignoring the untracked files is not without its annoyances (see comments).<br></br>

   ```sh
   dotgit config status.showUntrackedFiles no
   ```

   Helpfully, when using this setting if you run `dotgit status` you'll be prompted with "(use -u to show untracked files)". Unfortunately, the `-u` flag shows _everything_ in .dotfiles bare repo, recursively. With the `-unormal` flag, `dotgit status` shows only untracked files and directories in the cwd. <br></br>

4. Setup remote repo

   ```sh
   dotgit remote add origin remote-url
   ```

5. Start adding files.
