#include <stddef.h>
#include <stdio.h>

#include "clay.h"

#define ABI_TYPE(type) \
    printf("T %s %zu %zu\n", #type, sizeof(type), _Alignof(type))
#define ABI_FIELD(type, field) \
    printf("F %s.%s %zu\n", #type, #field, offsetof(type, field))

int main(void) {
    ABI_TYPE(Clay_String);
    ABI_TYPE(Clay_StringSlice);
    ABI_TYPE(Clay_Arena);
    ABI_TYPE(Clay_Dimensions);
    ABI_TYPE(Clay_Vector2);
    ABI_TYPE(Clay_Color);
    ABI_TYPE(Clay_BoundingBox);
    ABI_TYPE(Clay_ElementId);
    ABI_TYPE(Clay_ElementIdArray);
    ABI_TYPE(Clay_CornerRadius);
    ABI_TYPE(Clay_LayoutDirection);
    ABI_TYPE(Clay_LayoutAlignmentX);
    ABI_TYPE(Clay_LayoutAlignmentY);
    ABI_TYPE(Clay__SizingType);
    ABI_TYPE(Clay_ChildAlignment);
    ABI_TYPE(Clay_SizingMinMax);
    ABI_TYPE(Clay_SizingAxis);
    ABI_TYPE(Clay_Sizing);
    ABI_TYPE(Clay_Padding);
    ABI_TYPE(Clay__Clay_PaddingWrapper);
    ABI_TYPE(Clay_LayoutConfig);
    ABI_TYPE(Clay__Clay_LayoutConfigWrapper);
    ABI_TYPE(Clay_TextElementConfigWrapMode);
    ABI_TYPE(Clay_TextAlignment);
    ABI_TYPE(Clay_TextElementConfig);
    ABI_TYPE(Clay__Clay_TextElementConfigWrapper);
    ABI_TYPE(Clay_AspectRatioElementConfig);
    ABI_TYPE(Clay__Clay_AspectRatioElementConfigWrapper);
    ABI_TYPE(Clay_ImageElementConfig);
    ABI_TYPE(Clay__Clay_ImageElementConfigWrapper);
    ABI_TYPE(Clay_FloatingAttachPointType);
    ABI_TYPE(Clay_FloatingAttachPoints);
    ABI_TYPE(Clay_PointerCaptureMode);
    ABI_TYPE(Clay_FloatingAttachToElement);
    ABI_TYPE(Clay_FloatingClipToElement);
    ABI_TYPE(Clay_FloatingElementConfig);
    ABI_TYPE(Clay__Clay_FloatingElementConfigWrapper);
    ABI_TYPE(Clay_CustomElementConfig);
    ABI_TYPE(Clay__Clay_CustomElementConfigWrapper);
    ABI_TYPE(Clay_ClipElementConfig);
    ABI_TYPE(Clay__Clay_ClipElementConfigWrapper);
    ABI_TYPE(Clay_BorderWidth);
    ABI_TYPE(Clay_BorderElementConfig);
    ABI_TYPE(Clay__Clay_BorderElementConfigWrapper);
    ABI_TYPE(Clay_TransitionData);
    ABI_TYPE(Clay_TransitionState);
    ABI_TYPE(Clay_TransitionProperty);
    ABI_TYPE(Clay_TransitionCallbackArguments);
    ABI_TYPE(Clay_TransitionEnterTriggerType);
    ABI_TYPE(Clay_TransitionExitTriggerType);
    ABI_TYPE(Clay_TransitionInteractionHandlingType);
    ABI_TYPE(Clay_ExitTransitionSiblingOrdering);
    ABI_TYPE(Clay_TransitionElementConfig);
    ABI_TYPE(Clay__Clay_TransitionElementConfigWrapper);
    ABI_TYPE(Clay_TextRenderData);
    ABI_TYPE(Clay_RectangleRenderData);
    ABI_TYPE(Clay_ImageRenderData);
    ABI_TYPE(Clay_CustomRenderData);
    ABI_TYPE(Clay_ClipRenderData);
    ABI_TYPE(Clay_OverlayColorRenderData);
    ABI_TYPE(Clay_BorderRenderData);
    ABI_TYPE(Clay_RenderData);
    ABI_TYPE(Clay_ScrollContainerData);
    ABI_TYPE(Clay_ElementData);
    ABI_TYPE(Clay_RenderCommandType);
    ABI_TYPE(Clay_RenderCommand);
    ABI_TYPE(Clay_RenderCommandArray);
    ABI_TYPE(Clay_PointerDataInteractionState);
    ABI_TYPE(Clay_PointerData);
    ABI_TYPE(Clay_ElementDeclaration);
    ABI_TYPE(Clay__Clay_ElementDeclarationWrapper);
    ABI_TYPE(Clay_ErrorType);
    ABI_TYPE(Clay_ErrorData);
    ABI_TYPE(Clay_ErrorHandler);

    ABI_FIELD(Clay_String, length);
    ABI_FIELD(Clay_String, chars);
    ABI_FIELD(Clay_StringSlice, baseChars);
    ABI_FIELD(Clay_Arena, capacity);
    ABI_FIELD(Clay_Arena, memory);
    ABI_FIELD(Clay_ElementId, stringId);
    ABI_FIELD(Clay_ElementIdArray, internalArray);
    ABI_FIELD(Clay_SizingAxis, type);
    ABI_FIELD(Clay_LayoutConfig, layoutDirection);
    ABI_FIELD(Clay_TextElementConfig, textAlignment);
    ABI_FIELD(Clay_FloatingElementConfig, attachPoints);
    ABI_FIELD(Clay_FloatingElementConfig, clipTo);
    ABI_FIELD(Clay_ClipElementConfig, childOffset);
    ABI_FIELD(Clay_BorderWidth, betweenChildren);
    ABI_FIELD(Clay_TransitionCallbackArguments, current);
    ABI_FIELD(Clay_TransitionCallbackArguments, properties);
    ABI_FIELD(Clay_TransitionElementConfig, enter);
    ABI_FIELD(Clay_TransitionElementConfig, exit);
    ABI_FIELD(Clay_TextRenderData, lineHeight);
    ABI_FIELD(Clay_ImageRenderData, imageData);
    ABI_FIELD(Clay_CustomRenderData, customData);
    ABI_FIELD(Clay_RenderCommand, renderData);
    ABI_FIELD(Clay_RenderCommand, commandType);
    ABI_FIELD(Clay_ScrollContainerData, found);
    ABI_FIELD(Clay_ElementData, found);
    ABI_FIELD(Clay_RenderCommandArray, internalArray);
    ABI_FIELD(Clay_PointerData, state);
    ABI_FIELD(Clay_ElementDeclaration, transition);
    ABI_FIELD(Clay_ElementDeclaration, userData);
    ABI_FIELD(Clay_ErrorData, userData);
    ABI_FIELD(Clay_ErrorHandler, userData);
    return 0;
}
