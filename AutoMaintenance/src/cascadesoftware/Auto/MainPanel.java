package cascadesoftware.Auto;

import java.awt.Color;
import java.awt.Graphics;
import javax.swing.JPanel;

class MainPanel extends JPanel {

	protected void paintComponent(Graphics g) {
		super.paintComponent(g);
		Color c = new Color(0, 0, 0);
		g.setColor(c);
		g.fillRect(0, 0, 800, 1200);
		c = new Color(255, 255, 255);
		g.setColor(c);
	}
}
