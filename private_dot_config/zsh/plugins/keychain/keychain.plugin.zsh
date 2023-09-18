# forked from https://github.com/ohmyzsh/ohmyzsh/blob/master/plugins/keychain/keychain.plugin.zsh
# Changes:
# 	- 2023-09-18: Add support for storing keychain data in another folder.
# 		      Default to SSH not GPG.
(( $+commands[keychain] )) || return

# Define SHORT_HOST if not defined (%m = host name up to first .)
SHORT_HOST=${SHORT_HOST:-${(%):-%m}}

function {
	local agents
	local -a identities
	local -a options
    local dir
	local _keychain_env_sh
	local _keychain_env_sh_gpg

	# load agents to start.
	zstyle -s :omz:plugins:keychain agents agents

	# load identities to manage.
	zstyle -a :omz:plugins:keychain identities identities

	# load additional options
	zstyle -a :omz:plugins:keychain options options

	# load runtime directory
	# TODO: default to $HOME/.keychain and alias to include --absolute --dir
	zstyle -s :omz:plugins:keychain dir dir
	# default to $HOME/.keychain if unset
	[[ -z "${dir}" ]] && dir="${HOME}/.keychain"

	# create an alias
	alias keychain="keychain --absolute --dir ${dir}"

	# start keychain...
	keychain ${^options:-} --agents ${agents:-ssh} ${^identities} --host $SHORT_HOST

	# Get the filenames to store/lookup the environment from
	_keychain_env_sh="${dir:-$HOME/.keychain}/$SHORT_HOST-sh"
	_keychain_env_sh_gpg="${dir:-$HOME/.keychain}/$SHORT_HOST-sh-gpg"

	# Source environment settings.
	[ -f "$_keychain_env_sh" ]     && . "$_keychain_env_sh"
	[ -f "$_keychain_env_sh_gpg" ] && . "$_keychain_env_sh_gpg"
}