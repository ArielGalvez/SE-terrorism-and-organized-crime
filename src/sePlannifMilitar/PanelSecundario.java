/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sePlannifMilitar;
import java.awt.Color;
import java.awt.Image;
import javax.swing.JLabel;
import java.awt.Point;
import java.awt.Toolkit;
import java.awt.Cursor;
import java.awt.Font;
import java.util.ArrayList;
import javax.swing.ImageIcon;
import javax.swing.JFrame;
import javax.swing.JPanel;
import javax.swing.JRadioButton;
import javax.swing.JOptionPane;
import javax.swing.JTextArea;
/*jess*/
import jess.ConsolePanel;
import jess.JessException;
import jess.Rete;
/**
 *
 * @author Ariel
 */
public class PanelSecundario extends javax.swing.JPanel {

    /**
     * Creates new form Inicio
     */
    private ArrayList <String> planificacion;
    private JTextArea areaPregunta;
    private Main padre;
    private Cursor cur;
    Rete motor;
    ConsolePanel consolaPanel;
    ArrayList <Object> datosConsola= new ArrayList();
    int contador=0;
    boolean esCrimenOrganizado;
    JOptionPane panelOpciones= new JOptionPane();
    
    public PanelSecundario(Main padre, boolean esCrimenOrganizado) {
        this.padre=padre;
        this.esCrimenOrganizado=esCrimenOrganizado;
        Image im = Toolkit.getDefaultToolkit().createImage("sonido/mira.png"); 
        cur = Toolkit.getDefaultToolkit().createCustomCursor(im, new Point(10,10),"WILL");
        datosConsola=getconsole();
        areaPregunta=new JTextArea();
        areaPregunta.setFont(new java.awt.Font("Tahoma", 1, 12));
        areaPregunta.setForeground(new java.awt.Color(204, 255, 82));
        areaPregunta.setCursor(Cursor.getDefaultCursor());
        areaPregunta.setFocusable(false);
        areaPregunta.setBorder(javax.swing.BorderFactory.createEmptyBorder(4, 4, 4, 4));
        initComponents();
        
        
    }
    /*public String preguntar2(String pregunta, ArrayList opciones){
        int tamano = opciones.size();
        Object datos[] = new Object[tamano];
        int i = 0;
        for (Object opcion : opciones) {
            datos[i] = (Object)opcion;
            i++;
        }
        int posX=10, posY=50;
        grupo_botones = new javax.swing.ButtonGroup();
        //botones.clear();
        for (int j = 0; j < datos.length; j++) {
            javax.swing.JRadioButton rdBtn = new javax.swing.JRadioButton(datos[j]+"");
            rdBtn.setBounds(posX, posY, 200, 30);
            panelPreguntas.add(rdBtn);
            //botones.add(rdBtn);
            grupo_botones.add(rdBtn);
            posY+=35;
        }
        Object res = panelOpciones.showInputDialog(null,pregunta,"Responda",
                  panelOpciones.INFORMATION_MESSAGE, 
                  null, datos, datos[0]);*/
        /*String respuesta = grupo_botones.getSelection().toString();
        return respuesta;
    }*/
    
    /*Metodo usado para preguntar, es llamado desde el lenguaje CLIP
    **recibe la pregunta y sus opciones de respuesta como parametros*/
    public String preguntar(String pregunta, ArrayList opciones){
        int tam = opciones.size();//pido el tam de las opciones
        areaPregunta.setText(pregunta);//actualizo la nueva pregunta
        Object datos[] = new Object[tam];//creo donde almacenare temporalmente las opciones
        int i = 0;//declaro un contador
        for (Object opcion : opciones) {//recorro y voy agregando las opciones de respuesta
            datos[i] = (Object)opcion;
            i++;
        }
        MyIconPersonalizado icon = new MyIconPersonalizado(65,100,"/images/preguntas/soldier.png");
        Object res = panelOpciones.showInputDialog(panelPreguntas,areaPregunta,"Pregunta",
                  panelOpciones.INFORMATION_MESSAGE, 
                  icon, datos, datos[0]);//muestro el mensaje con la pregunta y sus respuestas
        String respuesta = (String)res;//esto es lo que devolvere con el metodo
        return respuesta;//devuelvo la respuesta escogida
    }
    /*Metodo que hace la CONEXION de Jess con Java*/
    public ArrayList <Object> getconsole()
    {
        ArrayList <Object> lista=new ArrayList <Object>();
        Rete motorJess;//inicializo el motor de inferencia
        ConsolePanel consolas = null;
        motorJess=new Rete();//creo el motor de inferencia
        try {
            if(esCrimenOrganizado){//si es crimen organizado su respectiva base de conocimiento
                motorJess.batch("/base_conocimiento/conocimiento_crimen_organizado.clp");//cargo BC de Crimen Organizado
            }else//si no es crimen organizado entonces cargo la base de conocimiento de terrorismo
                motorJess.batch("/base_conocimiento/conocimiento_terrorismo.clp");//cargo BC de Terrorismo
            motorJess.store("VENTANA", this);
            consolas = new ConsolePanel(motorJess);//creo la consola del motor de inferencia
            
            motorJess.eval("(rules)");//evaluo las reglas
        } catch (JessException e) {
            System.out.println("ERROR " + e.getMessage());
        }
        lista.add(motorJess);//agrego a la lista el motor de inferencia
        lista.add(consolas);//agrego su consola del motor de inferencia
        return lista;//devuelvo la lista
    }
    
    public void setMemoriaTrabajo(String texto)
    {
        memoria_trabajo.append("\n" + texto);
    }
    public void iniciarMotorDeInferencia(){
        contador++;
        if(contador >=0) {
            try {
                planificacion= new ArrayList<>();
                motor= (Rete) datosConsola.get(0);
                motor.reset();
                motor.run();
                motor.eval("(facts)");
                motor.clear();
            } catch(JessException j){
                System.out.println(" " + j.getMessage());
            }
        } 
    }
    public void reiniciarMotorDeInferencia(){
        try {
                planificacion= new ArrayList<>();
                datosConsola=getconsole();
                motor= (Rete) datosConsola.get(0);
                motor.reset();
                motor.run();
                motor.eval("(facts)");
                motor.clear();
        } catch(JessException j){
            System.out.println(" " + j.getMessage());
        }        
    }
    
    public void setImagenResp(String nombre){
        ImageIcon setImg = createImageIcon("/respuestas_obtenidas/"+nombre,"fondo");
        //Image imabMedio = setImg.getImage();
        lblFondo.setIcon(setImg);
        lblFondo.setVisible(true);
	/*ImageIcon imagm = new ImageIcon(imabMedio.getScaledInstance(imabMedio.getWidth(null),imabMedio.getHeight(null), 1));
        JLabel contenido=new JLabel();
        contenido.setIcon(imagm);*/
    }
    
    private ImageIcon createImageIcon(String path, String description){
        java.net.URL imgURL = getClass().getResource(path);
        if (imgURL != null) {
            return new ImageIcon(imgURL, description);
        } else {
            System.err.println("Couldn't find file: " + path);
            return null;
        }
    }
    public void cambiarCaso(boolean esCrimenOrganizado){
        if(esCrimenOrganizado)
            lblCaso.setIcon(new javax.swing.ImageIcon(getClass().getResource("/images/preguntas/btnCrimen.png")));
        else
            lblCaso.setIcon(new javax.swing.ImageIcon(getClass().getResource("/images/preguntas/btnTerro.png")));
    }
    
    /*ultimos metodos agregados para usar desde clips*/
    public void addPlan(String plan){
        planificacion.add(plan);
    }
    public void mostrarPlan(){
        for (int i = 0; i < planificacion.size(); i++) {
            setMemoriaTrabajo((i+1)+". "+planificacion.get(i));
        }
    }
    /**
     * This method is called from within the constructor to initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is always
     * regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        lblCaso = new javax.swing.JLabel();
        jLabel1 = new javax.swing.JLabel();
        panelPreguntas = new javax.swing.JPanel();
        btnReiniciar = new javax.swing.JButton();
        lblFondo = new javax.swing.JLabel();
        panelMemoriaTrabajo = new javax.swing.JPanel();
        scrrolPanelPreg = new javax.swing.JScrollPane();
        memoria_trabajo = new javax.swing.JTextArea();
        panelMotorInferencia = new javax.swing.JPanel();
        fondo = new javax.swing.JLabel();

        setLayout(null);

        lblCaso.setIcon(new javax.swing.ImageIcon(getClass().getResource("/images/preguntas/btnCrimen.png"))); // NOI18N
        add(lblCaso);
        lblCaso.setBounds(10, 20, 300, 140);

        jLabel1.setIcon(new javax.swing.ImageIcon(getClass().getResource("/images/preguntas/portadaLarga.png"))); // NOI18N
        add(jLabel1);
        jLabel1.setBounds(300, 20, 680, 140);

        panelPreguntas.setBorder(javax.swing.BorderFactory.createTitledBorder(null, "Panel de Preguntas", javax.swing.border.TitledBorder.CENTER, javax.swing.border.TitledBorder.DEFAULT_POSITION, new java.awt.Font("Tahoma", 1, 12))); // NOI18N
        panelPreguntas.setLayout(null);

        btnReiniciar.setFont(new java.awt.Font("Tahoma", 1, 12)); // NOI18N
        btnReiniciar.setIcon(new javax.swing.ImageIcon(getClass().getResource("/images/preguntas/reiniciar.png"))); // NOI18N
        btnReiniciar.setToolTipText("reiniciar");
        btnReiniciar.setBorder(null);
        btnReiniciar.setBorderPainted(false);
        btnReiniciar.setContentAreaFilled(false);
        btnReiniciar.setFocusPainted(false);
        btnReiniciar.setRolloverIcon(new javax.swing.ImageIcon(getClass().getResource("/images/preguntas/reiniciar2.png"))); // NOI18N
        btnReiniciar.setCursor(cur);
        btnReiniciar.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnReiniciarActionPerformed(evt);
            }
        });
        panelPreguntas.add(btnReiniciar);
        btnReiniciar.setBounds(220, 340, 60, 50);

        lblFondo.setVisible(false);
        lblFondo.setOpaque(true);
        panelPreguntas.add(lblFondo);
        lblFondo.setBounds(10, 20, 500, 390);

        add(panelPreguntas);
        panelPreguntas.setBounds(10, 170, 520, 440);

        panelMemoriaTrabajo.setBorder(javax.swing.BorderFactory.createTitledBorder(null, "Memoria de Trabajo", javax.swing.border.TitledBorder.CENTER, javax.swing.border.TitledBorder.DEFAULT_POSITION, new java.awt.Font("Tahoma", 1, 12))); // NOI18N
        panelMemoriaTrabajo.setLayout(new javax.swing.BoxLayout(panelMemoriaTrabajo, javax.swing.BoxLayout.LINE_AXIS));

        scrrolPanelPreg.setBorder(null);

        memoria_trabajo.setColumns(20);
        memoria_trabajo.setRows(5);
        memoria_trabajo.setBorder(null);
        scrrolPanelPreg.setViewportView(memoria_trabajo);

        panelMemoriaTrabajo.add(scrrolPanelPreg);

        add(panelMemoriaTrabajo);
        panelMemoriaTrabajo.setBounds(540, 320, 440, 290);

        panelMotorInferencia.setBorder(javax.swing.BorderFactory.createTitledBorder(null, "Motor de Inferencia", javax.swing.border.TitledBorder.CENTER, javax.swing.border.TitledBorder.DEFAULT_POSITION, new java.awt.Font("Tahoma", 1, 12))); // NOI18N
        panelMotorInferencia.setLayout(null);
        //arrayList=getconsole();
        /// Cuadro de Base del Conocimiento
        consolaPanel=(ConsolePanel) datosConsola.get(1);
        consolaPanel.setBounds(10, 20, 420, 114);
        consolaPanel.setForeground(new Color(51,153,102));
        consolaPanel.setFont(new Font("Forte", Font.BOLD, 14));
        panelMotorInferencia.add(consolaPanel);
        add(panelMotorInferencia);
        panelMotorInferencia.setBounds(540, 170, 440, 140);

        fondo.setIcon(new javax.swing.ImageIcon(getClass().getResource("/images/fondoComun.png"))); // NOI18N
        add(fondo);
        fondo.setBounds(0, 0, 1020, 650);
    }// </editor-fold>//GEN-END:initComponents

    private void btnReiniciarActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnReiniciarActionPerformed
        // TODO add your handling code here:
        lblFondo.setVisible(false);
        padre.reproducirSonido();
        reiniciarMotorDeInferencia();
    }//GEN-LAST:event_btnReiniciarActionPerformed


    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton btnReiniciar;
    private javax.swing.JLabel fondo;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JLabel lblCaso;
    private javax.swing.JLabel lblFondo;
    private javax.swing.JTextArea memoria_trabajo;
    private javax.swing.JPanel panelMemoriaTrabajo;
    private javax.swing.JPanel panelMotorInferencia;
    private javax.swing.JPanel panelPreguntas;
    private javax.swing.JScrollPane scrrolPanelPreg;
    // End of variables declaration//GEN-END:variables
}
