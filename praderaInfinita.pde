float[] x; // horizontal points
float[] y; // vertical points
int N = 100; // Number of points
int i = 0;
int j = 0; // for the second drawing loop
boolean oneTime = true;

void setup() {
	size(1280, 720);
	background(0);
	stroke(255);
	x = linspace(0, width, N);
	y = linspace(0, height, N);
	//y = reverse(y); // reverse the points of the vertical axis to begin with the top.
	// frameRate(24);
}

void draw() {
	if (i < N) {
		line(0, y[i], x[i], 720);
		i = i + 1;
	} else if (j < N) {
		if (oneTime) { // reverse only the first time executed
			y = reverse(y);
			oneTime = false;
		}
		line(x[j], 720, 1280, y[j]);
		j = j + 1;
	} else {
		save("praderaInfinita.jpg");
		noLoop();
	}
}

float[] linspace(float initVal, float finVal, int numPoints) {
    /*
        Returns an array of numPoints equally spaced points between initVal and
        finVal.
    */
    float[] returnedArray = new float[numPoints];
    for (int i = 0; i < numPoints; i++) {
        returnedArray[i] = initVal + (finVal - initVal) * (float(i) / (numPoints-1)); // it is necessary to especify float in i,
                                                                                      // bc otherwise it changes the division to int
    }
    return returnedArray;
}