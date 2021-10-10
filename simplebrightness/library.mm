//
// Created by Angelo DeLuca on 10/10/21.
//

#include "library.h"

#include <Foundation/Foundation.h>
#include <CoreBrightness/CBClient.h>
#include <CoreBrightness/CBAdaptationClient.h>
#include <CoreBrightness/CBBlueLightClient.h>
#include <CoreBrightness/KeyboardBrightnessClient.h>
//#include <CoreBrightness/DisplayALSManager.h>

static CBClient *client = [[CBClient alloc] init];

bool simplebrightness::setNightShift(bool enabled) {
    CBBlueLightClient *blc = [client blueLightClient];
    return [blc setEnabled:enabled];
}

bool simplebrightness::setTrueTone(bool enabled) {
    CBAdaptationClient *adc = [client adaptationClient];
    return [adc setEnabled:enabled];
}

bool simplebrightness::setKeyboardBrightness(float value) {
    KeyboardBrightnessClient *kcli = [[KeyboardBrightnessClient alloc] init];

    return [kcli setBrightness:value forKeyboard:1];
}

// headers for screen brightness (DisplayALSManager) are probably outdated and thus won't link properly.
//bool simplebrightness::setScreenBrightness(float value) {
//    DisplayALSManager *man = [[DisplayALSManager alloc] init];
//    return [man updateDynamicSlider:value];
//}

//bool simplebrightness::setKeyboardBrightness(float value){
//
//}