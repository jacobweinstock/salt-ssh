{% set deps = salt['pillar.get']('dependencies:lookup', {}) %}
git:
  pkg.installed

{% for name, dep in deps.items() %}
{{name}}_formula:
  git.latest:
    - name: {{dep.repo}}
    - target: /tmp/{{name}}_tmp
    - rev: master
    - depth: 1
    - require:
      - pkg: git

{{name}}_formula_final_destination:
  file.copy:
    - name: /srv/salt/{{name}}
    - source: /tmp/{{name}}_tmp/{{name}}
    - makedirs: True
    - subdir: True
    - require:
      - git: {{name}}_formula
{% endfor %}