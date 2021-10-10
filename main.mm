#include <iostream>
#include <unistd.h>
#include <Foundation/Foundation.h>
#include "simplebrightness/library.h"

// Private frameworks...
#include <CoreBrightness/CBClient.h>
#include <CoreBrightness/CBBlueLightClient.h>
#include <CoreBrightness/CBAdaptationClient.h>

using namespace std;

bool nightshift_set(CBClient *client, BOOL enable){
    CBBlueLightClient *blc = [client blueLightClient];
    bool success = [blc setEnabled:enable];
    return success;
}

bool truetone_set(CBClient *client, BOOL enable){
    CBAdaptationClient *adc = [client adaptationClient];
    bool success = [adc setEnabled:enable];
    return success;
}

void print(const string& msg){
    cout << msg << endl;
}


int main() {
    cout << "CoreBrightness Test -- By: Angelo DeLuca" << endl << "--" << endl;

    // Check whether system supports blue light reduction and adaptation...
    bool blr_support = [CBClient supportsBlueLightReduction];
    bool tt_support = [CBClient supportsAdaptation];

    // Initialize CoreBrightness client.
    CBClient *client = [[CBClient alloc] init];

    if(blr_support){
        print("Your system supports blue light reduction.");
        print("Enabling Night Shift in five seconds...");

        sleep(5);

        bool ns_success = nightshift_set(client, true);
        if(ns_success){
            print("Night Shift enabled successfully.");
        }else{
            print("Night Shift enable failed.");
        }

        sleep(5);

        ns_success = nightshift_set(client, false);
        if(ns_success){
            print("Night Shift disabled successfully.");
        }else{
            print("Night Shift disable failed.");
        }

    }else{
        print("Your system does not support blue light reduction and the test cannot be completed.");
    }

    if(tt_support){
        print("Your system supports adaptation (which may refer to TrueTone).");

        print("Enabling TrueTone in five seconds...");

        sleep(5);

        bool tt_success = truetone_set(client, true);
        if(tt_success){
            print("TrueTone enabled successfully.");
        }else{
            print("TrueTone enable failed.");
        }

        sleep(5);

        tt_success = truetone_set(client, false);
        if(tt_success){
            print("TrueTone disabled successfully.");
        }else{
            print("TrueTone disable failed.");
        }

    }

    sleep(4);

    print("I will now flash the keyboard five times to test the backlight.");

    simplebrightness::setKeyboardBrightness(0);
    sleep(1);
    simplebrightness::setKeyboardBrightness(1);
    sleep(1);
    simplebrightness::setKeyboardBrightness(0);
    sleep(1);
    simplebrightness::setKeyboardBrightness(1);
    sleep(1);
    simplebrightness::setKeyboardBrightness(0);
    sleep(1);
    simplebrightness::setKeyboardBrightness(1);
    sleep(1);
    simplebrightness::setKeyboardBrightness(0);
    sleep(1);
    simplebrightness::setKeyboardBrightness(1);
    sleep(1);
    simplebrightness::setKeyboardBrightness(0);
    sleep(1);
    simplebrightness::setKeyboardBrightness(1);

    print("Test complete!");

    sleep(3);

    print("Resetting to 25% keyboard brightness...");

    simplebrightness::setKeyboardBrightness(0.25);

    sleep(2);

    return 0;
}
