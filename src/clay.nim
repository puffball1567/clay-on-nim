# Clay C API binding.
#
# Clay itself is not bundled. Make `clay.h` available on the C include path
# and link an implementation from exactly one C or C++ translation unit.
{.push header: "clay.h".}

# Clay declares these as packed enums in C, so their ABI size is one byte.
type
  Clay_LayoutDirection* {.importc, pure, size: sizeof(uint8).} = enum
    CLAY_LEFT_TO_RIGHT, CLAY_TOP_TO_BOTTOM
  Clay_LayoutAlignmentX* {.importc, pure, size: sizeof(uint8).} = enum
    CLAY_ALIGN_X_LEFT, CLAY_ALIGN_X_RIGHT, CLAY_ALIGN_X_CENTER
  Clay_LayoutAlignmentY* {.importc, pure, size: sizeof(uint8).} = enum
    CLAY_ALIGN_Y_TOP, CLAY_ALIGN_Y_BOTTOM, CLAY_ALIGN_Y_CENTER
  Clay_SizingType* {.importc: "Clay__SizingType", pure, size: sizeof(uint8).} = enum
    ClaySizingTypeFit, ClaySizingTypeGrow, ClaySizingTypePercent, ClaySizingTypeFixed
  Clay_TextElementConfigWrapMode* {.importc, pure, size: sizeof(uint8).} = enum
    CLAY_TEXT_WRAP_WORDS, CLAY_TEXT_WRAP_NEWLINES, CLAY_TEXT_WRAP_NONE
  Clay_TextAlignment* {.importc, pure, size: sizeof(uint8).} = enum
    CLAY_TEXT_ALIGN_LEFT, CLAY_TEXT_ALIGN_CENTER, CLAY_TEXT_ALIGN_RIGHT
  Clay_FloatingAttachPointType* {.importc, pure, size: sizeof(uint8).} = enum
    CLAY_ATTACH_POINT_LEFT_TOP, CLAY_ATTACH_POINT_LEFT_CENTER, CLAY_ATTACH_POINT_LEFT_BOTTOM,
    CLAY_ATTACH_POINT_CENTER_TOP, CLAY_ATTACH_POINT_CENTER_CENTER, CLAY_ATTACH_POINT_CENTER_BOTTOM,
    CLAY_ATTACH_POINT_RIGHT_TOP, CLAY_ATTACH_POINT_RIGHT_CENTER, CLAY_ATTACH_POINT_RIGHT_BOTTOM
  Clay_PointerCaptureMode* {.importc, pure, size: sizeof(uint8).} = enum
    CLAY_POINTER_CAPTURE_MODE_CAPTURE, CLAY_POINTER_CAPTURE_MODE_PASSTHROUGH
  Clay_FloatingAttachToElement* {.importc, pure, size: sizeof(uint8).} = enum
    CLAY_ATTACH_TO_NONE, CLAY_ATTACH_TO_PARENT, CLAY_ATTACH_TO_ELEMENT_WITH_ID, CLAY_ATTACH_TO_ROOT
  Clay_FloatingClipToElement* {.importc, pure, size: sizeof(uint8).} = enum
    CLAY_CLIP_TO_NONE, CLAY_CLIP_TO_ATTACHED_PARENT
  Clay_TransitionState* {.importc, pure, size: sizeof(cint).} = enum
    CLAY_TRANSITION_STATE_IDLE, CLAY_TRANSITION_STATE_ENTERING,
    CLAY_TRANSITION_STATE_TRANSITIONING, CLAY_TRANSITION_STATE_EXITING
  Clay_TransitionProperty* = cint
  Clay_TransitionEnterTriggerType* {.importc, pure, size: sizeof(uint8).} = enum
    CLAY_TRANSITION_ENTER_SKIP_ON_FIRST_PARENT_FRAME, CLAY_TRANSITION_ENTER_TRIGGER_ON_FIRST_PARENT_FRAME
  Clay_TransitionExitTriggerType* {.importc, pure, size: sizeof(uint8).} = enum
    CLAY_TRANSITION_EXIT_SKIP_WHEN_PARENT_EXITS, CLAY_TRANSITION_EXIT_TRIGGER_WHEN_PARENT_EXITS
  Clay_TransitionInteractionHandlingType* {.importc, pure, size: sizeof(uint8).} = enum
    CLAY_TRANSITION_DISABLE_INTERACTIONS_WHILE_TRANSITIONING_POSITION,
    CLAY_TRANSITION_ALLOW_INTERACTIONS_WHILE_TRANSITIONING_POSITION
  Clay_ExitTransitionSiblingOrdering* {.importc, pure, size: sizeof(uint8).} = enum
    CLAY_EXIT_TRANSITION_ORDERING_UNDERNEATH_SIBLINGS, CLAY_EXIT_TRANSITION_ORDERING_NATURAL_ORDER,
    CLAY_EXIT_TRANSITION_ORDERING_ABOVE_SIBLINGS
  Clay_RenderCommandType* {.importc, pure, size: sizeof(uint8).} = enum
    CLAY_RENDER_COMMAND_TYPE_NONE, CLAY_RENDER_COMMAND_TYPE_RECTANGLE, CLAY_RENDER_COMMAND_TYPE_BORDER,
    CLAY_RENDER_COMMAND_TYPE_TEXT, CLAY_RENDER_COMMAND_TYPE_IMAGE, CLAY_RENDER_COMMAND_TYPE_SCISSOR_START,
    CLAY_RENDER_COMMAND_TYPE_SCISSOR_END, CLAY_RENDER_COMMAND_TYPE_OVERLAY_COLOR_START,
    CLAY_RENDER_COMMAND_TYPE_OVERLAY_COLOR_END, CLAY_RENDER_COMMAND_TYPE_CUSTOM
  Clay_PointerDataInteractionState* {.importc, pure, size: sizeof(uint8).} = enum
    CLAY_POINTER_DATA_PRESSED_THIS_FRAME, CLAY_POINTER_DATA_PRESSED,
    CLAY_POINTER_DATA_RELEASED_THIS_FRAME, CLAY_POINTER_DATA_RELEASED
  Clay_ErrorType* {.importc, pure, size: sizeof(uint8).} = enum
    CLAY_ERROR_TYPE_TEXT_MEASUREMENT_FUNCTION_NOT_PROVIDED, CLAY_ERROR_TYPE_ARENA_CAPACITY_EXCEEDED,
    CLAY_ERROR_TYPE_ELEMENTS_CAPACITY_EXCEEDED, CLAY_ERROR_TYPE_TEXT_MEASUREMENT_CAPACITY_EXCEEDED,
    CLAY_ERROR_TYPE_DUPLICATE_ID, CLAY_ERROR_TYPE_FLOATING_CONTAINER_PARENT_NOT_FOUND,
    CLAY_ERROR_TYPE_PERCENTAGE_OVER_1, CLAY_ERROR_TYPE_INTERNAL_ERROR,
    CLAY_ERROR_TYPE_UNBALANCED_OPEN_CLOSE, CLAY_ERROR_TYPE_HASH_MAP_CAPACITY_EXCEEDED

type
  CLAY* = object  # namespace marker (zero-size)
  Clay_String* {.importc: "Clay_String", bycopy.} = object
    isStaticallyAllocated*: bool
    length*: int32
    chars*: cstring
  Clay_StringSlice* {.importc: "Clay_StringSlice", bycopy.} = object
    length*: int32
    chars*: cstring
    baseChars*: cstring
  Clay_Context* {.importc, incompleteStruct.} = object
  Clay_Arena* {.importc: "Clay_Arena", bycopy.} = object
    nextAllocation*: uint
    capacity*: csize_t
    memory*: cstring
  Clay_Dimensions* {.importc: "Clay_Dimensions", bycopy.} = object
    width*: cfloat
    height*: cfloat
  Clay_Vector2* {.importc: "Clay_Vector2", bycopy.} = object
    x*: cfloat
    y*: cfloat
  Clay_Color* {.importc: "Clay_Color", bycopy.} = object
    r*: cfloat
    g*: cfloat
    b*: cfloat
    a*: cfloat
  Clay_BoundingBox* {.importc: "Clay_BoundingBox", bycopy.} = object
    x*: cfloat
    y*: cfloat
    width*: cfloat
    height*: cfloat
  Clay_ElementId* {.importc: "Clay_ElementId", bycopy.} = object
    id*: uint32
    offset*: uint32
    baseId*: uint32
    stringId*: Clay_String
  Clay_ElementIdArray* {.importc: "Clay_ElementIdArray", bycopy.} = object
    capacity*: int32
    length*: int32
    internalArray*: pointer
  Clay_CornerRadius* {.importc: "Clay_CornerRadius", bycopy.} = object
    topLeft*: cfloat
    topRight*: cfloat
    bottomLeft*: cfloat
    bottomRight*: cfloat
  Clay_ChildAlignment* {.importc: "Clay_ChildAlignment", bycopy.} = object
    x*: Clay_LayoutAlignmentX
    y*: Clay_LayoutAlignmentY
  Clay_SizingMinMax* {.importc: "Clay_SizingMinMax", bycopy.} = object
    min*: cfloat
    max*: cfloat
  Clay_SizingAxis* {.importc: "Clay_SizingAxis", bycopy.} = object
    size*: array[2, cfloat]
    `type`*: Clay_SizingType
  Clay_Sizing* {.importc: "Clay_Sizing", bycopy.} = object
    width*: Clay_SizingAxis
    height*: Clay_SizingAxis
  Clay_Padding* {.importc: "Clay_Padding", bycopy.} = object
    left*: uint16
    right*: uint16
    top*: uint16
    bottom*: uint16
  Clay_Clay_PaddingWrapper* {.importc: "Clay__Clay_PaddingWrapper", bycopy.} = object
    wrapped*: Clay_Padding
  Clay_LayoutConfig* {.importc: "Clay_LayoutConfig", bycopy.} = object
    sizing*: Clay_Sizing
    padding*: Clay_Padding
    childGap*: uint16
    childAlignment*: Clay_ChildAlignment
    layoutDirection*: Clay_LayoutDirection
  Clay_Clay_LayoutConfigWrapper* {.importc: "Clay__Clay_LayoutConfigWrapper", bycopy.} = object
    wrapped*: Clay_LayoutConfig
  Clay_TextElementConfig* {.importc: "Clay_TextElementConfig", bycopy.} = object
    userData*: pointer
    textColor*: Clay_Color
    fontId*: uint16
    fontSize*: uint16
    letterSpacing*: uint16
    lineHeight*: uint16
    wrapMode*: Clay_TextElementConfigWrapMode
    textAlignment*: Clay_TextAlignment
  Clay_Clay_TextElementConfigWrapper* {.importc: "Clay__Clay_TextElementConfigWrapper", bycopy.} = object
    wrapped*: Clay_TextElementConfig
  Clay_AspectRatioElementConfig* {.importc: "Clay_AspectRatioElementConfig", bycopy.} = object
    aspectRatio*: cfloat
  Clay_Clay_AspectRatioElementConfigWrapper* {.importc: "Clay__Clay_AspectRatioElementConfigWrapper", bycopy.} = object
    wrapped*: Clay_AspectRatioElementConfig
  Clay_ImageElementConfig* {.importc: "Clay_ImageElementConfig", bycopy.} = object
    imageData*: pointer
  Clay_Clay_ImageElementConfigWrapper* {.importc: "Clay__Clay_ImageElementConfigWrapper", bycopy.} = object
    wrapped*: Clay_ImageElementConfig
  Clay_FloatingAttachPoints* {.importc: "Clay_FloatingAttachPoints", bycopy.} = object
    element*: Clay_FloatingAttachPointType
    parent*: Clay_FloatingAttachPointType
  Clay_FloatingElementConfig* {.importc: "Clay_FloatingElementConfig", bycopy.} = object
    offset*: Clay_Vector2
    expand*: Clay_Dimensions
    parentId*: uint32
    zIndex*: int16
    attachPoints*: Clay_FloatingAttachPoints
    pointerCaptureMode*: Clay_PointerCaptureMode
    attachTo*: Clay_FloatingAttachToElement
    clipTo*: Clay_FloatingClipToElement
  Clay_Clay_FloatingElementConfigWrapper* {.importc: "Clay__Clay_FloatingElementConfigWrapper", bycopy.} = object
    wrapped*: Clay_FloatingElementConfig
  Clay_CustomElementConfig* {.importc: "Clay_CustomElementConfig", bycopy.} = object
    customData*: pointer
  Clay_Clay_CustomElementConfigWrapper* {.importc: "Clay__Clay_CustomElementConfigWrapper", bycopy.} = object
    wrapped*: Clay_CustomElementConfig
  Clay_ClipElementConfig* {.importc: "Clay_ClipElementConfig", bycopy.} = object
    horizontal*: bool
    vertical*: bool
    childOffset*: Clay_Vector2
  Clay_Clay_ClipElementConfigWrapper* {.importc: "Clay__Clay_ClipElementConfigWrapper", bycopy.} = object
    wrapped*: Clay_ClipElementConfig
  Clay_BorderWidth* {.importc: "Clay_BorderWidth", bycopy.} = object
    left*: uint16
    right*: uint16
    top*: uint16
    bottom*: uint16
    betweenChildren*: uint16
  Clay_BorderElementConfig* {.importc: "Clay_BorderElementConfig", bycopy.} = object
    color*: Clay_Color
    width*: Clay_BorderWidth
  Clay_Clay_BorderElementConfigWrapper* {.importc: "Clay__Clay_BorderElementConfigWrapper", bycopy.} = object
    wrapped*: Clay_BorderElementConfig
  Clay_TransitionData* {.importc: "Clay_TransitionData", bycopy.} = object
    boundingBox*: Clay_BoundingBox
    backgroundColor*: Clay_Color
    overlayColor*: Clay_Color
    borderColor*: Clay_Color
    borderWidth*: Clay_BorderWidth
  Clay_TransitionCallbackArguments* {.importc: "Clay_TransitionCallbackArguments", bycopy.} = object
    transitionState*: Clay_TransitionState
    initial*: Clay_TransitionData
    current*: pointer
    target*: Clay_TransitionData
    elapsedTime*: cfloat
    duration*: cfloat
    properties*: Clay_TransitionProperty
  Clay_TransitionEnterConfig* {.bycopy.} = object
    setInitialState*: pointer
    trigger*: Clay_TransitionEnterTriggerType
  Clay_TransitionExitConfig* {.bycopy.} = object
    setFinalState*: pointer
    trigger*: Clay_TransitionExitTriggerType
    siblingOrdering*: Clay_ExitTransitionSiblingOrdering
  Clay_TransitionElementConfig* {.importc: "Clay_TransitionElementConfig", bycopy.} = object
    handler*: pointer
    duration*: cfloat
    properties*: Clay_TransitionProperty
    interactionHandling*: Clay_TransitionInteractionHandlingType
    enter*: Clay_TransitionEnterConfig
    exit*: Clay_TransitionExitConfig
  Clay_Clay_TransitionElementConfigWrapper* {.importc: "Clay__Clay_TransitionElementConfigWrapper", bycopy.} = object
    wrapped*: Clay_TransitionElementConfig
  Clay_TextRenderData* {.importc: "Clay_TextRenderData", bycopy.} = object
    stringContents*: Clay_StringSlice
    textColor*: Clay_Color
    fontId*: uint16
    fontSize*: uint16
    letterSpacing*: uint16
    lineHeight*: uint16
  Clay_RectangleRenderData* {.importc: "Clay_RectangleRenderData", bycopy.} = object
    backgroundColor*: Clay_Color
    cornerRadius*: Clay_CornerRadius
  Clay_ImageRenderData* {.importc: "Clay_ImageRenderData", bycopy.} = object
    backgroundColor*: Clay_Color
    cornerRadius*: Clay_CornerRadius
    imageData*: pointer
  Clay_CustomRenderData* {.importc: "Clay_CustomRenderData", bycopy.} = object
    backgroundColor*: Clay_Color
    cornerRadius*: Clay_CornerRadius
    customData*: pointer
  Clay_ClipRenderData* {.importc: "Clay_ClipRenderData", bycopy.} = object
    horizontal*: bool
    vertical*: bool
  Clay_OverlayColorRenderData* {.importc: "Clay_OverlayColorRenderData", bycopy.} = object
    color*: Clay_Color
  Clay_BorderRenderData* {.importc: "Clay_BorderRenderData", bycopy.} = object
    color*: Clay_Color
    cornerRadius*: Clay_CornerRadius
    width*: Clay_BorderWidth
  Clay_RenderData* {.importc: "Clay_RenderData", bycopy, union.} = object
    rectangle*: Clay_RectangleRenderData
    text*: Clay_TextRenderData
    image*: Clay_ImageRenderData
    custom*: Clay_CustomRenderData
    border*: Clay_BorderRenderData
    clip*: Clay_ClipRenderData
    overlayColor*: Clay_OverlayColorRenderData
  Clay_ScrollContainerData* {.importc: "Clay_ScrollContainerData", bycopy.} = object
    scrollPosition*: pointer
    scrollContainerDimensions*: Clay_Dimensions
    contentDimensions*: Clay_Dimensions
    config*: Clay_ClipElementConfig
    found*: bool
  Clay_ElementData* {.importc: "Clay_ElementData", bycopy.} = object
    boundingBox*: Clay_BoundingBox
    found*: bool
  Clay_RenderCommand* {.importc: "Clay_RenderCommand", bycopy.} = object
    boundingBox*: Clay_BoundingBox
    renderData*: Clay_RenderData
    userData*: pointer
    id*: uint32
    zIndex*: int16
    commandType*: Clay_RenderCommandType
  Clay_RenderCommandArray* {.importc: "Clay_RenderCommandArray", bycopy.} = object
    capacity*: int32
    length*: int32
    internalArray*: ptr Clay_RenderCommand
  Clay_PointerData* {.importc: "Clay_PointerData", bycopy.} = object
    position*: Clay_Vector2
    state*: Clay_PointerDataInteractionState
  Clay_ElementDeclaration* {.importc: "Clay_ElementDeclaration", bycopy.} = object
    layout*: Clay_LayoutConfig
    backgroundColor*: Clay_Color
    overlayColor*: Clay_Color
    cornerRadius*: Clay_CornerRadius
    aspectRatio*: Clay_AspectRatioElementConfig
    image*: Clay_ImageElementConfig
    floating*: Clay_FloatingElementConfig
    custom*: Clay_CustomElementConfig
    clip*: Clay_ClipElementConfig
    border*: Clay_BorderElementConfig
    transition*: Clay_TransitionElementConfig
    userData*: pointer
  Clay_Clay_ElementDeclarationWrapper* {.importc: "Clay__Clay_ElementDeclarationWrapper", bycopy.} = object
    wrapped*: Clay_ElementDeclaration
  Clay_ErrorData* {.importc: "Clay_ErrorData", bycopy.} = object
    errorType*: Clay_ErrorType
    errorText*: Clay_String
    userData*: pointer
  Clay_ErrorHandler* {.importc: "Clay_ErrorHandler", bycopy.} = object
    errorHandlerFunction*: pointer
    userData*: pointer

type
  Clay_OnHoverFunction* = proc(elementId: Clay_ElementId; pointerData: Clay_PointerData; userData: pointer) {.cdecl.}
  Clay_MeasureTextFunction* = proc(text: Clay_StringSlice; config: ptr Clay_TextElementConfig; userData: pointer): Clay_Dimensions {.cdecl.}
  Clay_QueryScrollOffsetFunction* = proc(elementId: uint32; userData: pointer): Clay_Vector2 {.cdecl.}

proc sizingFit*(min, max: cfloat): Clay_SizingAxis {.importc: "CLAY_SIZING_FIT", cdecl.}
proc sizingGrow*(min, max: cfloat): Clay_SizingAxis {.importc: "CLAY_SIZING_GROW", cdecl.}
proc sizingFixed*(size: cfloat): Clay_SizingAxis {.importc: "CLAY_SIZING_FIXED", cdecl.}
proc sizingPercent*(percent: cfloat): Clay_SizingAxis {.importc: "CLAY_SIZING_PERCENT", cdecl.}

proc suppressUnusedLatchDefinitionVariableWarning*(_: type CLAY) {.importc: "Clay__SuppressUnusedLatchDefinitionVariableWarning", cdecl.}
proc minMemorySize*(_: type CLAY): uint32 {.importc: "Clay_MinMemorySize", cdecl.}
proc createArenaWithCapacityAndMemory*(_: type CLAY; capacity: csize_t; memory: pointer): Clay_Arena {.importc: "Clay_CreateArenaWithCapacityAndMemory", cdecl.}
proc setPointerState*(_: type CLAY; position: Clay_Vector2; pointerDown: bool) {.importc: "Clay_SetPointerState", cdecl.}
proc getPointerState*(_: type CLAY): Clay_PointerData {.importc: "Clay_GetPointerState", cdecl.}
proc initialize*(_: type CLAY; arena: Clay_Arena; layoutDimensions: Clay_Dimensions; errorHandler: Clay_ErrorHandler): pointer {.importc: "Clay_Initialize", cdecl.}
proc getCurrentContext*(_: type CLAY): pointer {.importc: "Clay_GetCurrentContext", cdecl.}
proc setCurrentContext*(_: type CLAY; context: pointer) {.importc: "Clay_SetCurrentContext", cdecl.}
proc updateScrollContainers*(_: type CLAY; enableDragScrolling: bool; scrollDelta: Clay_Vector2; deltaTime: cfloat) {.importc: "Clay_UpdateScrollContainers", cdecl.}
proc getScrollOffset*(_: type CLAY): Clay_Vector2 {.importc: "Clay_GetScrollOffset", cdecl.}
proc setLayoutDimensions*(_: type CLAY; dimensions: Clay_Dimensions) {.importc: "Clay_SetLayoutDimensions", cdecl.}
proc getLayoutDimensions*(_: type CLAY): Clay_Dimensions {.importc: "Clay_GetLayoutDimensions", cdecl.}
proc beginLayout*(_: type CLAY) {.importc: "Clay_BeginLayout", cdecl.}
proc endLayout*(_: type CLAY; deltaTime: cfloat): Clay_RenderCommandArray {.importc: "Clay_EndLayout", cdecl.}
proc getOpenElementId*(_: type CLAY): uint32 {.importc: "Clay_GetOpenElementId", cdecl.}
proc getElementId*(_: type CLAY; idString: Clay_String): Clay_ElementId {.importc: "Clay_GetElementId", cdecl.}
proc getElementIdWithIndex*(_: type CLAY; idString: Clay_String; index: uint32): Clay_ElementId {.importc: "Clay_GetElementIdWithIndex", cdecl.}
proc getElementData*(_: type CLAY; id: Clay_ElementId): Clay_ElementData {.importc: "Clay_GetElementData", cdecl.}
proc hovered*(_: type CLAY): bool {.importc: "Clay_Hovered", cdecl.}
proc onHover*(_: type CLAY; onHoverFunction: Clay_OnHoverFunction; userData: pointer) {.importc: "Clay_OnHover", cdecl.}
proc pointerOver*(_: type CLAY; elementId: Clay_ElementId): bool {.importc: "Clay_PointerOver", cdecl.}
proc getPointerOverIds*(_: type CLAY): Clay_ElementIdArray {.importc: "Clay_GetPointerOverIds", cdecl.}
proc getScrollContainerData*(_: type CLAY; id: Clay_ElementId): Clay_ScrollContainerData {.importc: "Clay_GetScrollContainerData", cdecl.}
proc setMeasureTextFunction*(_: type CLAY; measureTextFunction: Clay_MeasureTextFunction; userData: pointer) {.importc: "Clay_SetMeasureTextFunction", cdecl.}
proc setQueryScrollOffsetFunction*(_: type CLAY; queryScrollOffsetFunction: Clay_QueryScrollOffsetFunction; userData: pointer) {.importc: "Clay_SetQueryScrollOffsetFunction", cdecl.}
proc renderCommandArray_Get*(_: type CLAY; `array`: ptr Clay_RenderCommandArray; index: int32): ptr Clay_RenderCommand {.importc: "Clay_RenderCommandArray_Get", cdecl.}
proc setDebugModeEnabled*(_: type CLAY; enabled: bool) {.importc: "Clay_SetDebugModeEnabled", cdecl.}
proc isDebugModeEnabled*(_: type CLAY): bool {.importc: "Clay_IsDebugModeEnabled", cdecl.}
proc setCullingEnabled*(_: type CLAY; enabled: bool) {.importc: "Clay_SetCullingEnabled", cdecl.}
proc getMaxElementCount*(_: type CLAY): int32 {.importc: "Clay_GetMaxElementCount", cdecl.}
proc setMaxElementCount*(_: type CLAY; maxElementCount: int32) {.importc: "Clay_SetMaxElementCount", cdecl.}
proc getMaxMeasureTextCacheWordCount*(_: type CLAY): int32 {.importc: "Clay_GetMaxMeasureTextCacheWordCount", cdecl.}
proc setMaxMeasureTextCacheWordCount*(_: type CLAY; maxMeasureTextCacheWordCount: int32) {.importc: "Clay_SetMaxMeasureTextCacheWordCount", cdecl.}
proc resetMeasureTextCache*(_: type CLAY) {.importc: "Clay_ResetMeasureTextCache", cdecl.}
proc easeOut*(_: type CLAY; arguments: Clay_TransitionCallbackArguments): bool {.importc: "Clay_EaseOut", cdecl.}
proc openElement*(_: type CLAY) {.importc: "Clay__OpenElement", cdecl.}
proc openElementWithId*(_: type CLAY; elementId: Clay_ElementId) {.importc: "Clay__OpenElementWithId", cdecl.}
proc configureOpenElement*(_: type CLAY; config: Clay_ElementDeclaration) {.importc: "Clay__ConfigureOpenElement", cdecl.}
proc configureOpenElementPtr*(_: type CLAY; config: pointer) {.importc: "Clay__ConfigureOpenElementPtr", cdecl.}
proc closeElement*(_: type CLAY) {.importc: "Clay__CloseElement", cdecl.}
proc hashString*(_: type CLAY; key: Clay_String; seed: uint32): Clay_ElementId {.importc: "Clay__HashString", cdecl.}
proc hashStringWithOffset*(_: type CLAY; key: Clay_String; offset: uint32; seed: uint32): Clay_ElementId {.importc: "Clay__HashStringWithOffset", cdecl.}
proc openTextElement*(_: type CLAY; text: Clay_String; textConfig: Clay_TextElementConfig) {.importc: "Clay__OpenTextElement", cdecl.}

{.pop.}
