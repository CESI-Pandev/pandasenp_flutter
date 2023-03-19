enum Status {
  draft,
  published,
  archived,
}

const Map<String, Status> statusFromString = {
  'draft': Status.draft,
  'published': Status.published,
  'archived': Status.archived,
};
