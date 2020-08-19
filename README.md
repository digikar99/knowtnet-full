# Knowledge-Transfer

## Description

"Knowledge Transfer Network". Website exist[ed] at [https://knowtnet.com/](https://knowtnet.com/). JAMStack version of the website exists at [https://digikar99.github.io/knowtnet-react/](https://digikar99.github.io/knowtnet-react/).

## Loading

Requires

- SBCL Compiled with zlib support (to create the image "executable")
- `mysql libmysqlclient-dev libxml2-dev`
- Python: `argon2 passlib`

## Building

```
bash make.sh
```

Read up [make.sh](./make.sh) to know more.

## Dev Notes

- A container containing "visited nodes" and "frontier nodes" for each user. 
- Topics in feed are chosen from the frontier. 
- A topic is moved from frontier to visited when the user reaches the bottom of the topic in feed.

- During registration, and perhaps, from time to time, users are asked to mentione their "role in the world" - say, being a parent, a teen, a grandparent, a teacher, a high school student, an undergraduate student, a phd student, a driver, a policeman, and so on and so forth

- what's wrong with reddit and quora? that there are no subtopic graphs - there's just classification of posts. the posts are dictated by the community and what is trending - this model works for topics of current relevance, but breaks down for structured topics like mathematics, a programming language, parenting or something

- in essence, there exists a distinction between "courses" and "feed sites" like quora and reddit; and hardly anyone completes "courses". can this distinction be blurred? rather, let's attempt to blur this distinction

### Prototyping

- How do we prototype? What do we need to prototype?
