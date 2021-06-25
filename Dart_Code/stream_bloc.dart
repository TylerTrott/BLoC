Stream<int> boatStream() async* {
  // async meaning the function generates asynchronous data
  for (int i = 1; i <= 10; i++) {
    print("Sent boat no. " + i.toString());
    await Future.delayed(Duration(seconds: 2));
    // the await, waits for the process to finish
    // (which is delayed by 2 secs). So wait 2 secs
    // before sending the next piece of data
    yield i;
    // yield pushes the data down the river/stream
  }
}

void main(List<String> args) async {
  Stream<int> stream = boatStream();
  // init the stream

  stream.listen((receivedData) {
    // listen method is used to wait for incoming stream data
    print("Received boat no. " + receivedData.toString());
  });
}
