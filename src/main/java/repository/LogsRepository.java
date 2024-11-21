package repository;

import model.Logs;

public class LogsRepository extends GenericRepositoryIml<Logs, Long> {
    public LogsRepository() {
        super(Logs.class);
    }
}
