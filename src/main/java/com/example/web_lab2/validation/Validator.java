package com.example.web_lab2.validation;

import static java.lang.Math.*;

public class Validator{
    private final int MIN_X = -3;
    private final int MAX_XY = 3;
    private final int MIN_Y = -5;
    private final int MIN_R = 1;
    private final int MAX_R = 5;




    public Validator(float x, float y, float r) {
        this.x = x;
        this.y = y;
        this.r = r;
    }

    float x;
    float y;
    float r;
    public boolean validate() {
            if (!(x >= MIN_X && x <= MAX_XY)) {
                return false;
            }
            if (!(y >= MIN_Y && y <= MAX_XY)) {
                return false;
            }
            if (!(r >= MIN_R && r <= MAX_R)) {
                return false;
            }
            return true;
        }

}
