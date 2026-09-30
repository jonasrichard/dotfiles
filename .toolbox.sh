#!/usr/bin/env bash

u() {
    cat <<'EOF'
Toolbox scripts:
    drmi            - docker remove image
    load_ssh_key    - load ssh keys and start agent if it is not running
    pcd             - cd into a git-versioned project directory
EOF
}

load_ssh_key() {
    local agents

    agents=$(pgrep ssh-agent)
    [ -z "$agents" ] && eval "$(ssh-agent -s)" && ssh-add ~/.ssh/id_rsa
}

pcd() {
    PROJECT_DIR=$(find ~/projects/ -maxdepth 4 -name ".git" -type d -exec dirname {} \; | fzf)

    cd "$PROJECT_DIR" || exit
}

drmi() {
    local image_id

    image_id=$(docker images | tail -n +2 | fzf | awk '{print $2}')
    [ -z "$image_id" ] && return

    echo "Removing image: $image_id"
    docker rmi "$image_id"
}

_fzf_complete_docker_images() {
    _fzf_complete --reverse --prompt="Docker Images> " -- "$@" < <(
        docker images --format '{{.Repository}}:{{.Tag}}'
    )
}

_fzf_complete_docker() {
    local args=$*

    case "$args" in
    *"manifest inspect"*)
        _fzf_complete_docker_images "$@"
        ;;
    *"rmi"*)
        _fzf_complete_docker_images "$@"
        ;;
    *)
        eval "zle ${fzf_default_completion:-expand-or-complete}"
        ;;
    esac
}

_fzf_complete_docker_post() {
    awk '{print $1}'
}

#fzf-docker-image-widget() {
#    # Get local docker image repository:tag names
#    local selected_image
#
#    selected_image=$(docker images --format '{{.Repository}}:{{.Tag}}' | fzf --height 40% --reverse)
#
#    if [[ -n "$selected_image" ]]; then
#        LBUFFER="${LBUFFER}${selected_image}"
#    fi
#
#    zle reset-prompt
#}
#
## Register as a ZLE widget
#zle -N fzf-docker-image-widget
#
## Bind to Ctrl+I (or change ^I to your preferred key combination like ^g)
#bindkey '^F' fzf-docker-image-widget
