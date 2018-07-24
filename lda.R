library(topicmodels)

data("AssociatedPress", package = "topicmodels")
lda <- LDA(AssociatedPress, control = list(alpha = 0.1), k = 20)
save(lda, file="lda")

load(lda)
library(tidytext)
library(tidyverse)
ap_topics = tidy(lda, matrix = "beta")

ap_top_terms = ap_topics %>%
  group_by(topic) %>% top_n(10, beta) %>%
  ungroup() %>% arrange(topic, -beta)

ap_top_terms %>% filter(topic < 9) %>%
  mutate(term = reorder(term, beta)) %>%
  ggplot(aes(term, beta, fill = factor(topic))) +
  geom_col(show.legend = FALSE) +
  facet_wrap(~ topic, scales = "free") +
  coord_flip()

ap_documents = tidy(lda, matrix="gamma")
ap_documents %>% filter(topic == 1) %>%
  arrange(-gamma)
tidy(AssociatedPress) %>% filter(document == 434) %>%
  arrange(desc(count))
