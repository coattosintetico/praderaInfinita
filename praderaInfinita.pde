float[] x; // horizontal points
float[] y; // vertical points
int N = 100; // Number of points
// There's one index for each side that we want to draw lines on
int i = 0;
int j = 0;
int k = 0;
int l = 0;
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
        line(0, y[i], x[i], height);
        i++;
    } else if (j < N) {
        line(x[j], height, width, reverse(y)[j]);
        j++;
    } else if (k < N) {
        line(width, reverse(y)[k], reverse(x)[k], 0);
        k++;
    } else if (l < N) {
        line(reverse(x)[l], 0, 0, y[l]);
        l++;
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