#include <iostream>
#include <unistd.h>
#include <Foundation/Foundation.h>

// Private frameworks...
#include <CoreBrightness/CBClient.h>
#include <CoreBrightness/CBBlueLightClient.h>

using namespace std;


bool ns_enable(CBClient *client){

    // Enable night shift...
    CBBlueLightClient *blc = [client blueLightClient];
    bool success = [blc setEnabled:YES];

    return success;
}

int main() {

    // Check whether system supports blue light reduction and adaptation...
    bool blr_support = [CBClient supportsBlueLightReduction];
    bool tt_support = [CBClient supportsAdaptation];

    // Initialize CoreBrightness client.
    CBClient *client = [[CBClient alloc] init];

    if(blr_support){
        cout << "Your system supports blue light reduction." << endl;

        usleep(3);
        ns_enable(client);
    }else{
        cout << "Your system does not support blue light reduction." << endl;
    }

    if(tt_support){
        cout << "Your system supports adaptation (which may refer to TrueTone)." << endl;
    }


    return 0;
}
