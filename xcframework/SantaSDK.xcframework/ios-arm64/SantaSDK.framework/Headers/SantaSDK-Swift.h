#if 0
#elif defined(__arm64__) && __arm64__
// Generated by Apple Swift version 5.9.2 (swiftlang-5.9.2.2.56 clang-1500.1.0.2.5)
#ifndef SANTASDK_SWIFT_H
#define SANTASDK_SWIFT_H
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wgcc-compat"

#if !defined(__has_include)
# define __has_include(x) 0
#endif
#if !defined(__has_attribute)
# define __has_attribute(x) 0
#endif
#if !defined(__has_feature)
# define __has_feature(x) 0
#endif
#if !defined(__has_warning)
# define __has_warning(x) 0
#endif

#if __has_include(<swift/objc-prologue.h>)
# include <swift/objc-prologue.h>
#endif

#pragma clang diagnostic ignored "-Wauto-import"
#if defined(__OBJC__)
#include <Foundation/Foundation.h>
#endif
#if defined(__cplusplus)
#include <cstdint>
#include <cstddef>
#include <cstdbool>
#include <cstring>
#include <stdlib.h>
#include <new>
#include <type_traits>
#else
#include <stdint.h>
#include <stddef.h>
#include <stdbool.h>
#include <string.h>
#endif
#if defined(__cplusplus)
#if defined(__arm64e__) && __has_include(<ptrauth.h>)
# include <ptrauth.h>
#else
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wreserved-macro-identifier"
# ifndef __ptrauth_swift_value_witness_function_pointer
#  define __ptrauth_swift_value_witness_function_pointer(x)
# endif
# ifndef __ptrauth_swift_class_method_pointer
#  define __ptrauth_swift_class_method_pointer(x)
# endif
#pragma clang diagnostic pop
#endif
#endif

#if !defined(SWIFT_TYPEDEFS)
# define SWIFT_TYPEDEFS 1
# if __has_include(<uchar.h>)
#  include <uchar.h>
# elif !defined(__cplusplus)
typedef uint_least16_t char16_t;
typedef uint_least32_t char32_t;
# endif
typedef float swift_float2  __attribute__((__ext_vector_type__(2)));
typedef float swift_float3  __attribute__((__ext_vector_type__(3)));
typedef float swift_float4  __attribute__((__ext_vector_type__(4)));
typedef double swift_double2  __attribute__((__ext_vector_type__(2)));
typedef double swift_double3  __attribute__((__ext_vector_type__(3)));
typedef double swift_double4  __attribute__((__ext_vector_type__(4)));
typedef int swift_int2  __attribute__((__ext_vector_type__(2)));
typedef int swift_int3  __attribute__((__ext_vector_type__(3)));
typedef int swift_int4  __attribute__((__ext_vector_type__(4)));
typedef unsigned int swift_uint2  __attribute__((__ext_vector_type__(2)));
typedef unsigned int swift_uint3  __attribute__((__ext_vector_type__(3)));
typedef unsigned int swift_uint4  __attribute__((__ext_vector_type__(4)));
#endif

#if !defined(SWIFT_PASTE)
# define SWIFT_PASTE_HELPER(x, y) x##y
# define SWIFT_PASTE(x, y) SWIFT_PASTE_HELPER(x, y)
#endif
#if !defined(SWIFT_METATYPE)
# define SWIFT_METATYPE(X) Class
#endif
#if !defined(SWIFT_CLASS_PROPERTY)
# if __has_feature(objc_class_property)
#  define SWIFT_CLASS_PROPERTY(...) __VA_ARGS__
# else
#  define SWIFT_CLASS_PROPERTY(...) 
# endif
#endif
#if !defined(SWIFT_RUNTIME_NAME)
# if __has_attribute(objc_runtime_name)
#  define SWIFT_RUNTIME_NAME(X) __attribute__((objc_runtime_name(X)))
# else
#  define SWIFT_RUNTIME_NAME(X) 
# endif
#endif
#if !defined(SWIFT_COMPILE_NAME)
# if __has_attribute(swift_name)
#  define SWIFT_COMPILE_NAME(X) __attribute__((swift_name(X)))
# else
#  define SWIFT_COMPILE_NAME(X) 
# endif
#endif
#if !defined(SWIFT_METHOD_FAMILY)
# if __has_attribute(objc_method_family)
#  define SWIFT_METHOD_FAMILY(X) __attribute__((objc_method_family(X)))
# else
#  define SWIFT_METHOD_FAMILY(X) 
# endif
#endif
#if !defined(SWIFT_NOESCAPE)
# if __has_attribute(noescape)
#  define SWIFT_NOESCAPE __attribute__((noescape))
# else
#  define SWIFT_NOESCAPE 
# endif
#endif
#if !defined(SWIFT_RELEASES_ARGUMENT)
# if __has_attribute(ns_consumed)
#  define SWIFT_RELEASES_ARGUMENT __attribute__((ns_consumed))
# else
#  define SWIFT_RELEASES_ARGUMENT 
# endif
#endif
#if !defined(SWIFT_WARN_UNUSED_RESULT)
# if __has_attribute(warn_unused_result)
#  define SWIFT_WARN_UNUSED_RESULT __attribute__((warn_unused_result))
# else
#  define SWIFT_WARN_UNUSED_RESULT 
# endif
#endif
#if !defined(SWIFT_NORETURN)
# if __has_attribute(noreturn)
#  define SWIFT_NORETURN __attribute__((noreturn))
# else
#  define SWIFT_NORETURN 
# endif
#endif
#if !defined(SWIFT_CLASS_EXTRA)
# define SWIFT_CLASS_EXTRA 
#endif
#if !defined(SWIFT_PROTOCOL_EXTRA)
# define SWIFT_PROTOCOL_EXTRA 
#endif
#if !defined(SWIFT_ENUM_EXTRA)
# define SWIFT_ENUM_EXTRA 
#endif
#if !defined(SWIFT_CLASS)
# if __has_attribute(objc_subclassing_restricted)
#  define SWIFT_CLASS(SWIFT_NAME) SWIFT_RUNTIME_NAME(SWIFT_NAME) __attribute__((objc_subclassing_restricted)) SWIFT_CLASS_EXTRA
#  define SWIFT_CLASS_NAMED(SWIFT_NAME) __attribute__((objc_subclassing_restricted)) SWIFT_COMPILE_NAME(SWIFT_NAME) SWIFT_CLASS_EXTRA
# else
#  define SWIFT_CLASS(SWIFT_NAME) SWIFT_RUNTIME_NAME(SWIFT_NAME) SWIFT_CLASS_EXTRA
#  define SWIFT_CLASS_NAMED(SWIFT_NAME) SWIFT_COMPILE_NAME(SWIFT_NAME) SWIFT_CLASS_EXTRA
# endif
#endif
#if !defined(SWIFT_RESILIENT_CLASS)
# if __has_attribute(objc_class_stub)
#  define SWIFT_RESILIENT_CLASS(SWIFT_NAME) SWIFT_CLASS(SWIFT_NAME) __attribute__((objc_class_stub))
#  define SWIFT_RESILIENT_CLASS_NAMED(SWIFT_NAME) __attribute__((objc_class_stub)) SWIFT_CLASS_NAMED(SWIFT_NAME)
# else
#  define SWIFT_RESILIENT_CLASS(SWIFT_NAME) SWIFT_CLASS(SWIFT_NAME)
#  define SWIFT_RESILIENT_CLASS_NAMED(SWIFT_NAME) SWIFT_CLASS_NAMED(SWIFT_NAME)
# endif
#endif
#if !defined(SWIFT_PROTOCOL)
# define SWIFT_PROTOCOL(SWIFT_NAME) SWIFT_RUNTIME_NAME(SWIFT_NAME) SWIFT_PROTOCOL_EXTRA
# define SWIFT_PROTOCOL_NAMED(SWIFT_NAME) SWIFT_COMPILE_NAME(SWIFT_NAME) SWIFT_PROTOCOL_EXTRA
#endif
#if !defined(SWIFT_EXTENSION)
# define SWIFT_EXTENSION(M) SWIFT_PASTE(M##_Swift_, __LINE__)
#endif
#if !defined(OBJC_DESIGNATED_INITIALIZER)
# if __has_attribute(objc_designated_initializer)
#  define OBJC_DESIGNATED_INITIALIZER __attribute__((objc_designated_initializer))
# else
#  define OBJC_DESIGNATED_INITIALIZER 
# endif
#endif
#if !defined(SWIFT_ENUM_ATTR)
# if __has_attribute(enum_extensibility)
#  define SWIFT_ENUM_ATTR(_extensibility) __attribute__((enum_extensibility(_extensibility)))
# else
#  define SWIFT_ENUM_ATTR(_extensibility) 
# endif
#endif
#if !defined(SWIFT_ENUM)
# define SWIFT_ENUM(_type, _name, _extensibility) enum _name : _type _name; enum SWIFT_ENUM_ATTR(_extensibility) SWIFT_ENUM_EXTRA _name : _type
# if __has_feature(generalized_swift_name)
#  define SWIFT_ENUM_NAMED(_type, _name, SWIFT_NAME, _extensibility) enum _name : _type _name SWIFT_COMPILE_NAME(SWIFT_NAME); enum SWIFT_COMPILE_NAME(SWIFT_NAME) SWIFT_ENUM_ATTR(_extensibility) SWIFT_ENUM_EXTRA _name : _type
# else
#  define SWIFT_ENUM_NAMED(_type, _name, SWIFT_NAME, _extensibility) SWIFT_ENUM(_type, _name, _extensibility)
# endif
#endif
#if !defined(SWIFT_UNAVAILABLE)
# define SWIFT_UNAVAILABLE __attribute__((unavailable))
#endif
#if !defined(SWIFT_UNAVAILABLE_MSG)
# define SWIFT_UNAVAILABLE_MSG(msg) __attribute__((unavailable(msg)))
#endif
#if !defined(SWIFT_AVAILABILITY)
# define SWIFT_AVAILABILITY(plat, ...) __attribute__((availability(plat, __VA_ARGS__)))
#endif
#if !defined(SWIFT_WEAK_IMPORT)
# define SWIFT_WEAK_IMPORT __attribute__((weak_import))
#endif
#if !defined(SWIFT_DEPRECATED)
# define SWIFT_DEPRECATED __attribute__((deprecated))
#endif
#if !defined(SWIFT_DEPRECATED_MSG)
# define SWIFT_DEPRECATED_MSG(...) __attribute__((deprecated(__VA_ARGS__)))
#endif
#if !defined(SWIFT_DEPRECATED_OBJC)
# if __has_feature(attribute_diagnose_if_objc)
#  define SWIFT_DEPRECATED_OBJC(Msg) __attribute__((diagnose_if(1, Msg, "warning")))
# else
#  define SWIFT_DEPRECATED_OBJC(Msg) SWIFT_DEPRECATED_MSG(Msg)
# endif
#endif
#if defined(__OBJC__)
#if !defined(IBSegueAction)
# define IBSegueAction 
#endif
#endif
#if !defined(SWIFT_EXTERN)
# if defined(__cplusplus)
#  define SWIFT_EXTERN extern "C"
# else
#  define SWIFT_EXTERN extern
# endif
#endif
#if !defined(SWIFT_CALL)
# define SWIFT_CALL __attribute__((swiftcall))
#endif
#if !defined(SWIFT_INDIRECT_RESULT)
# define SWIFT_INDIRECT_RESULT __attribute__((swift_indirect_result))
#endif
#if !defined(SWIFT_CONTEXT)
# define SWIFT_CONTEXT __attribute__((swift_context))
#endif
#if !defined(SWIFT_ERROR_RESULT)
# define SWIFT_ERROR_RESULT __attribute__((swift_error_result))
#endif
#if defined(__cplusplus)
# define SWIFT_NOEXCEPT noexcept
#else
# define SWIFT_NOEXCEPT 
#endif
#if !defined(SWIFT_C_INLINE_THUNK)
# if __has_attribute(always_inline)
# if __has_attribute(nodebug)
#  define SWIFT_C_INLINE_THUNK inline __attribute__((always_inline)) __attribute__((nodebug))
# else
#  define SWIFT_C_INLINE_THUNK inline __attribute__((always_inline))
# endif
# else
#  define SWIFT_C_INLINE_THUNK inline
# endif
#endif
#if defined(_WIN32)
#if !defined(SWIFT_IMPORT_STDLIB_SYMBOL)
# define SWIFT_IMPORT_STDLIB_SYMBOL __declspec(dllimport)
#endif
#else
#if !defined(SWIFT_IMPORT_STDLIB_SYMBOL)
# define SWIFT_IMPORT_STDLIB_SYMBOL 
#endif
#endif
#if defined(__OBJC__)
#if __has_feature(objc_modules)
#if __has_warning("-Watimport-in-framework-header")
#pragma clang diagnostic ignored "-Watimport-in-framework-header"
#endif
@import CoreFoundation;
@import CoreLocation;
@import Foundation;
@import UIKit;
@import WebKit;
#endif

#endif
#pragma clang diagnostic ignored "-Wproperty-attribute-mismatch"
#pragma clang diagnostic ignored "-Wduplicate-method-arg"
#if __has_warning("-Wpragma-clang-attribute")
# pragma clang diagnostic ignored "-Wpragma-clang-attribute"
#endif
#pragma clang diagnostic ignored "-Wunknown-pragmas"
#pragma clang diagnostic ignored "-Wnullability"
#pragma clang diagnostic ignored "-Wdollar-in-identifier-extension"

#if __has_attribute(external_source_symbol)
# pragma push_macro("any")
# undef any
# pragma clang attribute push(__attribute__((external_source_symbol(language="Swift", defined_in="SantaSDK",generated_declaration))), apply_to=any(function,enum,objc_interface,objc_category,objc_protocol))
# pragma pop_macro("any")
#endif

#if defined(__OBJC__)


@class NSString;
@class WKContentWorld;

SWIFT_CLASS("_TtC8SantaSDK14STAdTagManager")
@interface STAdTagManager : WKUserScript
- (nonnull instancetype)init SWIFT_UNAVAILABLE;
+ (nonnull instancetype)new SWIFT_UNAVAILABLE_MSG("-init is unavailable");
- (nonnull instancetype)initWithSource:(NSString * _Nonnull)source injectionTime:(WKUserScriptInjectionTime)injectionTime forMainFrameOnly:(BOOL)forMainFrameOnly SWIFT_UNAVAILABLE;
- (nonnull instancetype)initWithSource:(NSString * _Nonnull)source injectionTime:(WKUserScriptInjectionTime)injectionTime forMainFrameOnly:(BOOL)forMainFrameOnly inContentWorld:(WKContentWorld * _Nonnull)contentWorld SWIFT_UNAVAILABLE;
@end


@class CLLocationManager;
@class CLLocation;

@interface STAdTagManager (SWIFT_EXTENSION(SantaSDK)) <CLLocationManagerDelegate>
- (void)locationManagerDidChangeAuthorization:(CLLocationManager * _Nonnull)manager;
- (void)locationManager:(CLLocationManager * _Nonnull)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status;
- (void)locationManager:(CLLocationManager * _Nonnull)manager didUpdateLocations:(NSArray<CLLocation *> * _Nonnull)locations;
- (void)locationManager:(CLLocationManager * _Nonnull)manager didFailWithError:(NSError * _Nonnull)error;
@end



@class NSCoder;

SWIFT_CLASS("_TtC8SantaSDK8STAdView")
@interface STAdView : UIView
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)coder SWIFT_UNAVAILABLE;
- (nonnull instancetype)initWithFrame:(CGRect)frame SWIFT_UNAVAILABLE;
@end



SWIFT_PROTOCOL("_TtP8SantaSDK16STAdViewDelegate_")
@protocol STAdViewDelegate
@optional
/// 광고를 성공적으로로드하면 전송됩니다.
/// 아직 삽입하지 않은 경우이 메소드를 구현하여보기 계층 구조에 광고보기를 삽입해야합니다.
/// @param  광고뷰
- (void)adViewDidLoadAd:(STAdView * _Nullable)view;
/// 광고로드에 실패 할 때 전송됩니다.
/// 빈 광고가 표시되지 않도록하려면이 메시지에 대한 응답으로 광고보기를 숨겨야합니다.
/// @param  광고뷰
- (void)adViewDidFailToLoadAd:(STAdView * _Nullable)view;
/// 콘텐츠를로드하려고 할 때 전송됩니다.
/// 이 메서드는 사용자가 광고보기를 탭할 때 호출됩니다.
/// 이 메서드의 구현은 사용자 상호 작용이 필요한 모든 애플리케이션 활동을 일시 중지해야합니다.
/// @param 광고뷰
/// @see <code>didLoadViewForAd:</code>
- (void)willLoadViewForAd:(STAdView * _Nullable)view;
/// 모달 콘텐츠를 닫았을 때 전송되어 애플리케이션에 제어권을 반환합니다.
/// 이 메소드의 구현은<code>willLoadViewForAd :</code>에 대한 응답으로 일시 중지 된 모든 애플리케이션 활동을 재개해야합니다.
/// @param view 광고뷰.
/// @see <code>willLoadViewForAd:</code>
- (void)didLoadViewForAd:(STAdView * _Nullable)view;
/// 사용자가 광고를 탭하여 애플리케이션에서 나 가려고 할 때 전송됩니다.
/// 이 메서드가 호출 된 직후 애플리케이션이 백그라운드로 이동합니다.
/// @param view 광고뷰
- (void)willLeaveApplicationFromAd:(STAdView * _Nullable)view;
@end

@class NSBundle;

SWIFT_CLASS("_TtC8SantaSDK20STInterstitialAdView")
@interface STInterstitialAdView : UIViewController
- (void)viewDidLoad;
@property (nonatomic, readonly) BOOL prefersStatusBarHidden;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)coder SWIFT_UNAVAILABLE;
- (nonnull instancetype)initWithNibName:(NSString * _Nullable)nibNameOrNil bundle:(NSBundle * _Nullable)nibBundleOrNil SWIFT_UNAVAILABLE;
@end



/// The delegate of an <code>STInterstitialAdView</code> object must adopt the
/// <code>STInterstitialAdViewDelegate</code> protocol.
/// 이 프로토콜의 선택적 메소드를 사용하면 광고가로드 된 때, 광고가 화면에서 표시되거나 닫힐 때, 광고가 만료 된 때와 같은 전면 광고 상태 변경에 대해 대리자가 알림을받을 수 있습니다.
SWIFT_PROTOCOL("_TtP8SantaSDK28STInterstitialAdViewDelegate_")
@protocol STInterstitialAdViewDelegate
@optional
/// 전면 광고를 성공적으로로드하면 전송됩니다.
/// @param interstitial 메시지를 보내는 전면 광고 클래스입니다.
- (void)interstitialDidLoadAd:(STInterstitialAdView * _Nullable)interstitial;
/// 광고를로드하지 못할 때 전송됩니다.
/// @param interstitial 메시지를 보내는 전면 광고 클래스입니다.
- (void)interstitialDidFailToLoadAd:(STInterstitialAdView * _Nullable)interstitial;
/// 전면 광고가 화면에 표시되기 직전에 전송됩니다.
/// 이 메소드의 구현은 사용자 상호 작용이 필요한 모든 애플리케이션 활동을 일시 중지해야합니다.
/// @param interstitial 메시지를 보내는 전면 광고 클래스입니다.
- (void)interstitialWillAppear:(STInterstitialAdView * _Nullable)interstitial;
/// 전면 광고가 화면에 표시된 후에 전송됩니다.
/// @param interstitial 메시지를 보내는 전면 광고 클래스입니다.
- (void)interstitialDidAppear:(STInterstitialAdView * _Nullable)interstitial;
/// 전면 광고가 화면에 표시되지 못할때
/// @param interstitial 메시지를 보내는 전면 광고 클래스입니다.
- (void)interstitialDidFailToShow:(STInterstitialAdView * _Nullable)interstitial;
/// 전면 광고가 화면에서 닫히기 직전에 전송됩니다.
/// @param interstitial 메시지를 보내는 전면 광고 클래스입니다.
- (void)interstitialWillDisappear:(STInterstitialAdView * _Nullable)interstitial;
/// 전면 광고가 화면에서 해제 된 후 전송되어 애플리케이션에 제어권이 반환됩니다.
/// 이 방법을 구현하면 전면 광고가 화면에 표시되기 전에 일시 중지 된 모든 애플리케이션 활동이 재개되어야합니다.
/// @param interstitial 메시지를 보내는 전면 광고 클래스입니다.
- (void)interstitialDidDisappear:(STInterstitialAdView * _Nullable)interstitial;
/// 로드 된 전면 광고를 더 이상 표시 할 수 없을 때 전송됩니다.
/// 특정 네트워크의 전면 광고는 콘텐츠가 현재 화면에 있더라도 언제든지 콘텐츠가 만료 될 수 있습니다. 이 메소드는 현재로드 된 전면 광고가 만료되어 더 이상 표시 할 수없는 경우 알려줍니다.
/// 광고가 만료 될 때 화면에 표시 되었다면이 메시지가 전송 될 때 이미 광고가 닫 혔을 것입니다.
/// 원하는 경우 새 광고를 가져 오는<code>loadAd</code> 호출이 구현에 포함될 수 있습니다.
/// @param interstitial 메시지를 보내는 전면 광고 클래스입니다.
- (void)interstitialDidExpire:(STInterstitialAdView * _Nullable)interstitial;
/// 사용자가 전면 광고를 탭하고 광고가 타겟 작업을 수행하려고 할 때 전송됩니다.
/// 이 작업에는 모달 표시 또는 애플리케이션 종료가 포함될 수 있습니다. 특정 광고 네트워크는 ‘탭된’콜백을 노출하지 않을 수 있으므로이 콜백에 의존하여 중요한 작업을 수행해서는 안됩니다.
/// @param interstitial 메시지를 보내는 전면 광고 클래스입니다.
- (void)interstitialDidReceiveTapEvent:(STInterstitialAdView * _Nullable)interstitial;
@end

@class UILabel;
@class UIImageView;

/// STNativeAdRenderingDelegate 프로토콜은 맞춤보기 클래스에 광고 콘텐츠를 표시하는 방법을 제공합니다.
/// 정적 네이티브 광고와 네이티브 동영상 광고 모두에 사용할 수 있습니다.
/// 네이티브 동영상 광고를 게재하는 경우 nativeVideoView를 구현해야합니다.
SWIFT_PROTOCOL("_TtP8SantaSDK27STNativeAdRenderingDelegate_")
@protocol STNativeAdRenderingDelegate
@optional
/// 메인 텍스트에 사용하고있는 UILabel을 반환합니다.
/// @return 본문에 사용되는 UILabel
- (UILabel * _Nullable)nativeMainTextLabel SWIFT_WARN_UNUSED_RESULT;
/// 제목 텍스트에 사용중인 UILabel을 반환합니다.
/// @return 제목 텍스트에 사용되는 UILabel
- (UILabel * _Nullable)nativeTitleTextLabel SWIFT_WARN_UNUSED_RESULT;
/// 아이콘 이미지에 사용중인 UIImageView를 반환합니다.
/// @return 아이콘 이미지에 사용되는 UIImageView.
- (UIImageView * _Nullable)nativeIconImageView SWIFT_WARN_UNUSED_RESULT;
/// 메인 이미지에 사용중인 UIImageView를 반환합니다.
/// @return 메인 이미지에 사용되는 UIImageView
- (UIImageView * _Nullable)nativeMainImageView SWIFT_WARN_UNUSED_RESULT;
/// 비디오에 사용하는 UIView를 반환합니다.
/// 동영상 광고를 게재 할 때만이를 구현하면됩니다.
/// @return 동영상을 보관하는 데 사용되는 UIView
- (UIView * _Nullable)nativeVideoView SWIFT_WARN_UNUSED_RESULT;
/// *클릭 유도 문안 (cta) 텍스트에 사용중인 UILabel을 반환합니다.
/// *
/// <ul>
///   <li>
///     @return cta 텍스트에 사용되는 UILabel
///   </li>
/// </ul>
- (UILabel * _Nullable)nativeCallToActionTextLabel SWIFT_WARN_UNUSED_RESULT;
/// 개인 정보 아이콘에 대해 뷰가 사용중인 UIImageView를 반환합니다.
/// @return개인 정보 아이콘에 사용되는 UIImageView
- (UIImageView * _Nullable)nativePrivacyInformationIconImageView SWIFT_WARN_UNUSED_RESULT;
@end






@interface WKWebView (SWIFT_EXTENSION(SantaSDK))
@property (nonatomic, readonly) UIEdgeInsets safeAreaInsets;
@end

#endif
#if __has_attribute(external_source_symbol)
# pragma clang attribute pop
#endif
#if defined(__cplusplus)
#endif
#pragma clang diagnostic pop
#endif

#else
#error unsupported Swift architecture
#endif
