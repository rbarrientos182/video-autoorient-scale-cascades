import bb.cascades 1.0

NavigationPane {
    id: navMain 
    
    Page {
        id: pageMain
        
        content: Container {
            id: contMain

            layout: DockLayout {

            }

            Button {
                id: btnGoVideo
                text: "Ver Video"
                verticalAlignment: VerticalAlignment.Center
                horizontalAlignment: HorizontalAlignment.Center
                
                onClicked: {
                    var miVideoQML = cVideoQML.createObject();
                    navMain.push(miVideoQML);
                }
                
            }//btnGoVideo
            
        }//contMain
        
        attachedObjects: [
            ComponentDefinition {
                id: cVideoQML
                source: "video.qml"
            }
        ]
        
    }//pageMain
    
    onPopTransitionEnded: {
        page.destroy();
    }
    
}//navMain