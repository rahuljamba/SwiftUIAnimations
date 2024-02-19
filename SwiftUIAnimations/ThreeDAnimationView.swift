//
//  3DAnimationView.swift
//  SwiftUIAnimations
//
//  Created by Rahul Jamba on 19/02/24.
//

import SwiftUI
import SceneKit

struct ThreeDAnimationView: View {

    @State var scene: SCNScene = .init(named: "Cartoon_face.scn")!

    @State var iSelected: Bool = true
    
    var body: some View {
        VStack {
            
            Spacer()
              
            Text("Code \n Psychiatrist")
                .font(.system(size: 50)).bold()
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
                .shadow(color: .white, radius: 10 ,x: -10, y: -10)
                .shadow(color: .gray, radius: 10 ,x: 10, y: 10)
            
            Spacer()
            
            HStack{
                Image(systemName: "house.fill")
                    .foregroundColor(iSelected ? .black : .gray)
                    .font(.largeTitle)
                    .padding(.leading, 20)
                    .onTapGesture {
                        iSelected = true
                        updateModel(changeDirection: false)
                    }
                
                Spacer()
                
                Image(systemName: "gearshape.circle.fill")
                    .foregroundColor(!iSelected ? .black : .gray)
                    .foregroundColor(.white)
                    .font(.largeTitle)
                    .padding(.trailing, 20)
                    .onTapGesture {
                        iSelected = false
                        updateModel(changeDirection: true)
                    }
                
            }
            .frame(maxWidth: .infinity)
            .frame(height: 100)
            .background(Color.smoke)
            .cornerRadius(10)
            .shadow(color: .white.opacity(0.5), radius: 5, x: -10, y: -10)
            .shadow(color: .gray.opacity(0.5), radius: 5, x: 10, y: 10)
            .padding(.bottom, 15)
            .padding(.horizontal, 10)
            .padding()
            .overlay {
                SceneView(scene: $scene)
                    .frame(width: 200, height: 200)
                    .position(x: UIScreen.main.bounds.width / 2 ,y: 10)
                    .onTapGesture {
                       updateModel(changeDirection: false, reset: true)
                    }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.smoke)
        .ignoresSafeArea()
    }
    
    func updateModel(changeDirection:Bool, reset:Bool = false) {
        
        SCNTransaction.begin()
        SCNTransaction.animationDuration = 0.4
        
        if reset {
            scene.rootNode.eulerAngles.x = .zero
            scene.rootNode.eulerAngles.y = .zero
        }else {
            if changeDirection {
                scene.rootNode.eulerAngles.x = 0.10
                
                scene.rootNode.eulerAngles.y = 0.25
            }else {
                scene.rootNode.eulerAngles.x = 0.10
                scene.rootNode.eulerAngles.y = -0.25
            }
        }
        
        SCNTransaction.commit()
    }
    
}

#Preview {
    ThreeDAnimationView()
}

struct SceneView : UIViewRepresentable {

    @Binding var scene: SCNScene

    func makeUIView(context: Context) -> SCNView {
        let view = SCNView()
        view.allowsCameraControl = false
        view.autoenablesDefaultLighting = true
        view.antialiasingMode = .multisampling2X
        view.scene = scene
        view.backgroundColor = .clear
        return view
    }

    func updateUIView(_ uiView: SCNView, context: Context) {

    }

    typealias UIViewType = SCNView

}
