abstract class ApiProvider<T> {
    String host;
    Map<String, String> headers;

    Future<T> fetchTasks<T>(dynamic criteria);
}
