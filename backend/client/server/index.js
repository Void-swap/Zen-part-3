const express = require("express");
const { createServer } = require("http");
const { Server } = require("socket.io");

const app = express();
const httpServer = createServer(app);
const io = new Server(httpServer);

app.route("/").get((_anomynous_group, res) => {
	res.json("Hey there, welcome again on dev");
});

io.on("connection", (socket) => {
	socket.join("anomynous_group");
	console.log("Backend connected");

	socket.on("sendMsg", (msg) => {
		console.log("Received message:", msg);
		io.to("anomynous_group").emit("sendMsgServer", {
			...msg,
			type: "otherMsg",
		});
	});
});

httpServer.listen(3000, () => {
	console.log("Server is running on port 3000");
});
