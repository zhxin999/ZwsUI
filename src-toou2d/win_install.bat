
SET PWD_PATH=%2
SET PRESET_PATH=%3
SET BUILDER_BIN_PATH=%4
SET QT_QML_T2D_PATH=%5
SET ANDROID=%6
SET LIBFILE_PATH=%7
SET RELEASE_TYPE=%8

echo %RUN_TYPE%
echo %PWD_PATH%
echo %PRESET_PATH%
echo %BUILDER_BIN_PATH%
echo %QT_QML_T2D_PATH%

copy /y  %PWD_PATH%\Toou2D.h  %BUILDER_BIN_PATH% & copy /y  %PRESET_PATH%\*  %BUILDER_BIN_PATH%\

if %ANDROID% == YES copy /y %LIBFILE_PATH% %BUILDER_BIN_PATH%

if %1 == SHARED (

    echo running install to qtqml folder for %RELEASE_TYPE%
    
    echo dst path %QT_QML_T2D_PATH%

    if %RELEASE_TYPE% == release (
        copy /y %BUILDER_BIN_PATH%\Toou2D.dll %QT_QML_T2D_PATH%\Toou2D.dll
    ) else (
        copy /y %BUILDER_BIN_PATH%\Toou2Dd.dll %QT_QML_T2D_PATH%\Toou2Dd.dll
        copy /y %BUILDER_BIN_PATH%\Toou2Dd.pdb %QT_QML_T2D_PATH%\Toou2Dd.pdb
    )
    copy /y %BUILDER_BIN_PATH%\plugin.qmltypes %QT_QML_T2D_PATH%\plugin.qmltypes
    copy /y %BUILDER_BIN_PATH%\qmldir %QT_QML_T2D_PATH%\qmldir
    copy /y %BUILDER_BIN_PATH%\Toou2D.h %QT_QML_T2D_PATH%\Toou2D.h

rem     rmdir /s /q %QT_QML_T2D_PATH% & md %QT_QML_T2D_PATH%
rem      copy /y %BUILDER_BIN_PATH% %QT_QML_T2D_PATH%
)
