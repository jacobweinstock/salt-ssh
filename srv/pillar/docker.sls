# vi: set ft=yaml:

docker:
  version: '18.03.1~ce-0~ubuntu'

docker-containers:
  lookup:
        
    coredns-service:
      # example Prometheus container using command arguments
      image: "coredns/coredns:1.1.3"
      cmd:
      args:
        - '-conf /Corefile'
        - '-log'
      # Pull image on service restart (useful if you override the same tag. example: latest)
      pull_before_start: True
      # Do not force container removal on stop (unless true)
      remove_on_stop: false
      runoptions:
        - '-p53:2053/UDP'
        - '-p 53:2053'
        - '-v /apps/coredns/Corefile:/Corefile'
      stopoptions:
        - '-t 10'