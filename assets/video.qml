import bb.cascades 1.0
import bb.multimedia 1.0

Page {
    id: pageVideo
    property int devicePortraitWidth:768

    Container {
        id: contVideo

        layout: DockLayout {

        }

        ForeignWindowControl {
            id: fwcVideoSurface
            windowId: "myVideoSurface"
            visible: boundToWindow
            
            verticalAlignment: VerticalAlignment.Center
            horizontalAlignment: HorizontalAlignment.Center
            
            updatedProperties: WindowProperty.Size | WindowProperty.Position | WindowProperty.Visible
            preferredHeight: (player.videoDimensions.height*devicePortraitWidth)/player.videoDimensions.width
            
        }//fwcVideoSurface

        attachedObjects: [
            MediaPlayer {
                id: player
                sourceUrl: "asset:///video.mp4"
                videoOutput: VideoOutput.PrimaryDisplay
                windowId: fwcVideoSurface.windowId
            },
            OrientationHandler {
                onOrientationAboutToChange: {
                    if (orientation == UIOrientation.Portrait) {
                        fwcVideoSurface.preferredHeight= (player.videoDimensions.height*devicePortraitWidth)/player.videoDimensions.width       
                    } else {
                        fwcVideoSurface.preferredHeight= devicePortraitWidth
                    }
                }
            }
        ]

    } //contVideo

    actions: [
        ActionItem {
            id: btnPlay
            title: "Play"
            imageSource: "asset:///images/icoPlay.png"
            ActionBar.placement: ActionBarPlacement.OnBar
            onTriggered: {
                player.play();
            }
        },
        ActionItem {
            id: btnStop
            title: "Stop"
            imageSource: "asset:///images/icoStop.png"
            ActionBar.placement: ActionBarPlacement.OnBar
            onTriggered: {
                player.stop();
            }
        }
    ]
    
    paneProperties: [
        NavigationPaneProperties {
            backButton: ActionItem {
                onTriggered: {
                    player.stop();
                    navMain.pop();
                }
            }
        }
    ]
    
}//pageVideo