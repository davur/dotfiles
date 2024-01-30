workon()
{
	if [[ -z $1 ]]; then
		cd "$HOME/repos/$(cd ~/repos; find . -type d -maxdepth 2 | fzf)";
	fi;
	curdir=${PWD##*/};
	curdir=${curdir:-/};
	parent=$(dirname $PWD);
	parent=${parent##*/};
	combo="${parent}_${curdir}";
	venv_path="${HOME}/virtualenvs/${combo}";
	if [ ! -z ${VIRTUAL_ENV+x} ]; then
		deactivate
	fi;
	if [ ! -d "${venv_path}" ]; then
		python3 -m venv "${venv_path}";
	fi;
	source "${venv_path}/bin/activate"
}
