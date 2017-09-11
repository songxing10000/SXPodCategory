
#ifdef __OBJC__
#import <Foundation/NSString.h>
#endif

#if __has_extension(attribute_overloadable)

static inline __attribute__((overloadable)) NSString * stringFrom(id arg) {
    return [NSString stringWithFormat:@"%@", arg];
}

static inline __attribute__((overloadable)) NSString * stringFrom(char arg) {
    return [NSString stringWithFormat:@"%c", arg];
}

static inline __attribute__((overloadable)) NSString * stringFrom(unsigned char arg) {
    return [NSString stringWithFormat:@"%c", arg];
}

static inline __attribute__((overloadable)) NSString * stringFrom(short arg) {
    return [NSString stringWithFormat:@"%hd", arg];
}

static inline __attribute__((overloadable)) NSString * stringFrom(unsigned short arg) {
    return [NSString stringWithFormat:@"%hu", arg];
}

static inline __attribute__((overloadable)) NSString * stringFrom(int arg) {
    return [NSString stringWithFormat:@"%d", arg];
}

static inline __attribute__((overloadable)) NSString * stringFrom(unsigned int arg) {
    return [NSString stringWithFormat:@"%u", arg];
}

static inline __attribute__((overloadable)) NSString * stringFrom(long arg) {
    return [NSString stringWithFormat:@"%ld", arg];
}

static inline __attribute__((overloadable)) NSString * stringFrom(unsigned long arg) {
    return [NSString stringWithFormat:@"%lu", arg];
}

static inline __attribute__((overloadable)) NSString * stringFrom(long long arg) {
    return [NSString stringWithFormat:@"%lld", arg];
}

static inline __attribute__((overloadable)) NSString * stringFrom(unsigned long long arg) {
    return [NSString stringWithFormat:@"%llu", arg];
}

static inline __attribute__((overloadable)) NSString * stringFrom(float arg) {
    return [NSString stringWithFormat:@"%f", arg];
}

static inline __attribute__((overloadable)) NSString * stringFrom(double arg) {
    return [NSString stringWithFormat:@"%f", arg];
}

#endif
