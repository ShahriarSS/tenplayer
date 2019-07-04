import QtQuick 2.10
import QtQuick.Controls 2.3
import QtQuick.Controls.Material 2.3
import QtQuick.Layouts 1.3
import "../STools"

Page {
	id: page
	Layout.fillWidth: true
	Layout.fillHeight: true

	property int loader

	background: Item { }

	header: Label {
		padding: 10
		text: title
		elide: Text.ElideRight
		horizontalAlignment: Text.AlignHCenter
		font.pointSize: consts.mediumFont

		background: Rectangle {
			color: Material.primary
		}
	}

	ListView {
		id: view
		anchors.fill: parent
		emptyText: "Nothing Found!"

		model: SubSearchModel {
			loader: page.loader

			onMenuRequested: {
				menu.x = x-view.contentX
				menu.y = y-view.contentY
				menu.currentInd = index
				menu.open()
			}
		}
	}
}
