cmake_minimum_required(VERSION 3.16)

project(analog_clock VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 6.4 REQUIRED COMPONENTS Quick)

qt_standard_project_setup()

qt_add_executable(appanalog_clock
    main.cpp
)

qt_add_qml_module(appanalog_clock
    URI analog_clock
    VERSION 1.0
    QML_FILES
        Main.qml
        QML_FILES Clock.qml
        QML_FILES
        QML_FILES
        QML_FILES
        QML_FILES
        QML_FILES
        QML_FILES
        QML_FILES
        QML_FILES
        QML_FILES
        QML_FILES
        QML_FILES
        QML_FILES
        QML_FILES
        QML_FILES ClockNeedles.qml
        QML_FILES
        QML_FILES ClockFunctions.qml
        QML_FILES ClockFace.qml
        QML_FILES DashedCircles.qml
        QML_FILES ControlButtons.qml
        QML_FILES DigitalTime.qml
        QML_FILES
)

# Qt for iOS sets MACOSX_BUNDLE_GUI_IDENTIFIER automatically since Qt 6.1.
# If you are developing for iOS or macOS you should consider setting an
# explicit, fixed bundle identifier manually though.
set_target_properties(appanalog_clock PROPERTIES
#    MACOSX_BUNDLE_GUI_IDENTIFIER com.example.appanalog_clock
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(appanalog_clock
    PRIVATE Qt6::Quick
)

include(GNUInstallDirs)
install(TARGETS appanalog_clock
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
