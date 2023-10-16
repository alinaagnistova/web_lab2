package com.example.web_lab2;

import static java.lang.Math.*;

public class Validator implements IValidator {
    public Validator(float x, float y, float r) {
        this.x = x;
        this.y = y;
        this.r = r;
    }

    float x;
    float y;
    float r;
    @Override
    public boolean validate() {
            if (!(x >= -2 && x <= 2 && String.valueOf(x).length()<= 10)) {
                return false;
            }
            if (!(y >= -5 && y <= 5 && String.valueOf(y).length() <= 10)) {
                return false;
            }
            if (!(r >= 1 && r <= 4 && String.valueOf(r).length() <= 10)) {
                return false;
            }
            return true;
        }
//}

    @Override
    public boolean rectangle() {
        return (x <= 0 && x >= -r && y <= 0 && y >= -r / 2);
    }

    @Override
    public boolean triangle() {
        return (x >= 0 && x <= r / 2 && y <= 0 && y >= -r);
    }

    @Override
    public boolean circle() {
        return (x >= 0 && y >= 0 && pow(x, 2) + pow(y, 2) <= pow(r / 2, 2));
    }

    @Override
    public boolean checkout() {
        return rectangle() || triangle() || circle();
    }
}
