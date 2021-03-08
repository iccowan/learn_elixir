defmodule CounterWeb.TodoLive do
    use CounterWeb, :live_view
    alias Counter.Todos

    def mount(_params, _session, socket) do
        Todos.subscribe()

        {:ok, fetch(socket)}
    end

    def handle_event("new", %{"todo" => title}, socket) do
        Todos.create_todo(title)
    end

    def handle_event("toggle_done", %{"id" => id}, socket) do
        todo = Todos.get_todo!(id)
        Todos.update_todo(todo, %{done: ! todo.done})
    end

    def handle_event("remove", %{"id" => id}, socket) do
        todo = Todos.get_todo!(id)
        Todos.delete_todo(todo)
    end

    def handle_info({Todos, [:todo | _], _}, socket) do
        {:noreply, fetch(socket)}
    end

    def fetch(socket) do
        assign(socket, todos: Todos.list_todos())
    end
end
