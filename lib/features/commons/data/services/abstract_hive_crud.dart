abstract class AbstractHiveCrud<T> {
  Future<T> insert(T data);
  Future<T> update(T data);
  Future<bool> delete(T data);
  Future<T> findOne(dynamic filters);
  Future<List<T>> findMany(dynamic filters);
}
