import React from 'react';
import ReactDOM from 'react-dom';

class ListesLieesReact extends React.Component{

    constructor() {
        super();
        this.state = {
            title: "Titre",
            utilisateurs: [],
            comptes: [],

        }
        this.recupererComptes = this.recupererComptes.bind(this);
    }
    componentDidMount(){
        fetch(APP_URL+'/api/utilisateurs', {
            method:'GET'
        }).then(response => response.json())
            .then(response => {
                

                this.setState({utilisateurs: response.data});
            }).catch(function(error){
                console.log('ERREUR : '+ error.message);
        });
    }


    recupererComptes(e){
        const requestsOptions={
            method: 'POST',
            data: {'_token':CSRF_TOKEN, id: e.target.value}
        }

        var post = axios(APP_URL+'/api/getCompteByUtilisateur', requestsOptions)

            .then(response=>{

                this.setState({comptes: response.data});

            }).catch(function(error){
                console.log('ERREUR : '+ error.message);
        })

    }

    render(){
        return (
            <div className="mt-2">

                            <div className="mt-3 mb-3"><h2>[En construction] avec React</h2></div>
                            <select defaultValue="-1" onChange={this.recupererComptes} className="form-control" name="utilisateur" id="utilisateur_liste_dependante"
                                    form="formulaireAjoutOperation">
                                <option hidden disabled value="-1">Faites un choix dans la liste</option>
                                {this.state.utilisateurs.map((item, i) => {

                                    return <option value={item.id} key={item.id}>{item.nom}</option>

                                })}
                            </select>
                <br />
                    <select defaultValue="-1" className="form-control" name="utilisateur" id="utilisateur_liste_dependante"
                        form="formulaireAjoutOperation">
                        <option hidden disabled value="-1"/>
                        {this.state.comptes.map((item, i) => {
                            return <option value={item.id} key={item.id}>{item.nom}</option>

                        })}
                    </select>
                <br/>
                            <button className="btn btn-primary" onClick={()=>{
                                alert('envoyé');
                            }}>
                                {this.props.value}
                            </button>

            </div>
        );
    }

}

export default ListesLieesReact;

// DOM element
if (document.getElementById('listes-liees-react')) {
    ReactDOM.render(<ListesLieesReact name="PASCAL" value="Bouton bizarre"/>, document.getElementById('listes-liees-react'));
}