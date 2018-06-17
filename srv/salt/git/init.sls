{% set formulas = salt['pillar.get']('dependencies:lookup:formulas', {}) %}
{% set pillars = salt['pillar.get']('dependencies:lookup:pillars', {}) %}

git:
  pkg.installed

{% for name, formula in formulas.items() %}

{{name}}_formula:
  git.latest:
    - name: {{formula.repo}}
    - target: /tmp/{{name}}_tmp
    #- target: /srv/salt/{{name}}
    - rev: master
    - depth: 1
    - require:
      - pkg: git

{{name}}_formula_final_destination:
  file.copy:
    - name: /srv/salt/{{name}}
    - source: /tmp/{{name}}_tmp/{{formula.name}}
    - makedirs: True
    - subdir: True
    - require:
      - git: {{name}}_formula

{% endfor %}

{% for name, pillar in pillars.items() %}

{{name}}_pillar:
  git.latest:
    - name: {{pillar.repo}}
    - target: /tmp/pillar/{{name}}
    - rev: master
    - depth: 1
    - reload_modules: true
    - require:
      - pkg: git

{% endfor %}