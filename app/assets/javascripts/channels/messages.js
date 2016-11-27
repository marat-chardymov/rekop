App.messages = App.cable.subscriptions.create("MessagesChannel", {
    connected: function (data) {
        // Called when the subscription is ready for use on the server
    },

    disconnected: function () {
        // Called when the subscription has been terminated by the server
    },
    received: function (data) {
        // Called when there's incoming data on the websocket for this channel
        $("#messages").removeClass('hidden')
        return $('#messages').append(this.renderMessage(data));
    },

    renderMessage: function(data) {
        return "<p> <b>" + data.user + ": </b>" + data.message + "</p>";
    },
});