# Como subir esse projeto pro GitHub e GitLab

Pré-requisito: já ter criado os 2 repositórios vazios (sem README) no GitHub e no GitLab.

## 1. Adicionar os dois remotos

```bash
git remote add origin https://github.com/SEU-USUARIO/fiado-digital.git
git remote add gitlab https://gitlab.com/SEU-USUARIO/fiado-digital.git
```

`origin` = GitHub (convenção padrão)
`gitlab` = nome que escolhemos pro segundo remoto

## 2. Verificar se ficou certo

```bash
git remote -v
```

Deve aparecer os dois, cada um com (fetch) e (push).

## 3. Enviar pros dois

```bash
git push -u origin main
git push -u gitlab main
```

O `-u` só é necessário na primeira vez (ele "lembra" o destino padrão de cada branch).

## Alternativa: push único pros dois remotos de uma vez

Se quiser digitar `git push` e mandar pra ambos automaticamente, dá pra configurar um remoto "combo":

```bash
git remote add all https://github.com/SEU-USUARIO/fiado-digital.git
git remote set-url --add --push all https://github.com/SEU-USUARIO/fiado-digital.git
git remote set-url --add --push all https://gitlab.com/SEU-USUARIO/fiado-digital.git
```

Depois, sempre que quiser mandar pros dois: `git push all main`

## Observação sobre branch

Se seu Git ainda usar `master` como nome padrão (versões mais antigas), troque `main` pelos comandos acima por `master`, ou renomeie antes:

```bash
git branch -M main
```
