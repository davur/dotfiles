red=`tput setaf 1`
green=`tput setaf 2`
reset=`tput sgr0`

alias kubeenv='alias kubeenv; echo $KUBENAMESPACE; echo $KUBECONTEXT'

# alias k='alias k; echo "$KUBECONTEXT $KUBENAMESPACE"; echo ""; kubectl --context=$KUBECONTEXT --namespace=$KUBENAMESPACE'

function kenv() {
  if [[ $# -eq 2 ]]; then
    export KUBENAMESPACE=$1
    export KUBECONTEXT=$2
  elif [[ $# -eq 1 ]]; then
    export KUBENAMESPACE=$1
  fi
  echo "KUBENAMESPACE=$KUBENAMESPACE"
  echo "KUBECONTEXT=$KUBECONTEXT"
}

alias k='alias k; kubectl --context="$KUBECONTEXT" -n "$KUBENAMESPACE"'
alias ka='alias ka; kubectl --context="$KUBECONTEXT" -n "$KUBENAMESPACE" --all-namespaces=true'
alias stern='alias stern; stern --context="$KUBECONTEXT" -n "$KUBENAMESPACE"'



# generic kubectl with current contect and namespace

function kns() {
  if [[ $# -eq 1 ]]; then
    export KUBENAMESPACE=$1
  else
    echo "KUBENAMESPACE=$KUBENAMESPACE"
  fi
}

function kbash() {
  podid=$(kubectl --context=$KUBECONTEXT --namespace=$KUBENAMESPACE get pods -oname | cut -d/ -f2 | grep $1 |  head -n 1)
  shift
  kubectl --context=$KUBECONTEXT --namespace=$KUBENAMESPACE exec -ti $podid "$@" -- env COLUMNS=$COLUMNS LINES=$LINES TERM=$TERM /bin/bash
}

function klogs() {
  podid=$(kubectl --context=$KUBECONTEXT --namespace=$KUBENAMESPACE get pods -oname | cut -d/ -f2 | grep $1 |  head -n 1)
  shift
  echo $podid
  kubectl --context=$KUBECONTEXT --namespace=$KUBENAMESPACE logs $podid --tail=5000 "$@" | less
}

function klogall() {
  podid=$(kubectl --context=$KUBECONTEXT --namespace=$KUBENAMESPACE get pods -oname | cut -d/ -f2 | grep $1 |  head -n 1)
  shift
  echo $podid
  logfile="$HOME/logs/`date +%Y%m%d-%H%M%S`-$podid.log"
  echo $logfile
  kubectl --context=$KUBECONTEXT --namespace=$KUBENAMESPACE logs $podid "$@" > $logfile
  vi $logfile
}

function logs() {
  logfile=$(find ~/logs -iname "*$1*" | tail -n1)
  echo $logfile
  vi $logfile
}



function klogf() {
  podid=$(kubectl --context=$KUBECONTEXT --namespace=$KUBENAMESPACE get pods -oname | cut -d/ -f2 | grep $1 |  head -n 1)
  shift
  echo $podid
  kubectl --context=$KUBECONTEXT --namespace=$KUBENAMESPACE logs $podid --follow --tail=1 "$@"
}

# function kget() {
#   if [[ $# -eq 1 ]]; then
# 	kubectl --context=$KUBECONTEXT --namespace=$KUBENAMESPACE get $1 -o wide | less
#   elif [[ $# -eq 2 ]]; then
#     kubectl --context=$KUBECONTEXT --namespace=$KUBENAMESPACE get $1 -o wide | awk "NR==1 || /$2/"
#   if [[ $# -gt 1 ]]; then
#     kubectl --context=$KUBECONTEXT --namespace=$KUBENAMESPACE get $1 -o wide | awk "NR==1 || /$2/"
#   else
# 	kubectl --context=$KUBECONTEXT --namespace=$KUBENAMESPACE get $1 -o wide | less
#   fi
# }

function kget() {
  if [[ $# -eq 1 ]]; then
    echo "${green}
Services: ${reset}"
    kubectl --context=$KUBECONTEXT --namespace=$KUBENAMESPACE get service -o wide | awk "NR==1 || /$1/"

    echo "${green}
Deployments: ${reset}"
    kubectl --context=$KUBECONTEXT --namespace=$KUBENAMESPACE get deploy -o wide | awk "NR==1 || /$1/"

    echo "${green}
Pods: ${reset}"
    kubectl --context=$KUBECONTEXT --namespace=$KUBENAMESPACE get pod -o wide | awk "NR==1 || /$1/"

    echo "${green}
Configmaps: ${reset}"
    kubectl --context=$KUBECONTEXT --namespace=$KUBENAMESPACE get configmap -o wide | awk "NR==1 || /$1/"

    echo "${green}
Persistant Volumes: ${reset}"
    kubectl --context=$KUBECONTEXT --namespace=$KUBENAMESPACE get pv -o wide | awk "NR==1 || /$1/"

    echo "${green}
Persistant Volume Claims: ${reset}"
    kubectl --context=$KUBECONTEXT --namespace=$KUBENAMESPACE get pvc -o wide | awk "NR==1 || /$1/"
  elif [[ $# -eq 2 ]]; then
    kubectl --context=$KUBECONTEXT --namespace=$KUBENAMESPACE get $2 -o wide | awk "NR==1 || /$1/"
  else
    echo "Usage: kget SEARCHTERM [RESOURCE]"
  fi
}

