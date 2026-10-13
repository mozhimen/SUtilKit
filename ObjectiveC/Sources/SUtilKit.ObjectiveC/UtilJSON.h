//
//  UtilJSON.h
//  SUtilKit.ObjectiveC
//
//  Created by Taiyou on 2026/8/19.
//

static NSString *jsonString(id JSONObject) {
    NSError *error = nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:JSONObject
                                                       options:NSJSONWritingPrettyPrinted
                                                         error:&error];
    if (jsonData == nil) {
        return nil;
    }
    return [[NSString alloc] initWithData:jsonData
                                 encoding:NSUTF8StringEncoding];
}
