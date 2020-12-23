import React from 'react';
import ReactDOM from 'react-dom';
import Recaptcha from 'react-recaptcha';

class ReCaptchaConnexion extends React.Component {


    constructor() {
        super();

        this.state = {
            estVerifie:false
        };

        this.recaptchaLoaded = this.recaptchaLoaded.bind(this);
        this.verifyCallback = this.verifyCallback.bind(this);
    }

    componentDidMount() {

    }

    verifyCallback(response){
        if(response){

            this.setState({estVerifie:response});
        }
    }
    recaptchaLoaded(){
        console.log("RECAPTCHA LOADED SUCCESFULLY");
    }

    render() {

        return (
            <div className="mt-2">
                <Recaptcha sitekey="6LfXGxIaAAAAACEkmU8qkZjfwuEp5hhfn0yT0Y6D"
                    render={"explicit"}
                           onloadCallback={this.recaptchaLoaded}
                           verifyCallback={this.verifyCallback}
                />
                <input type="hidden" name="estVerifie" value={this.state.estVerifie} />


            </div>
        );
    }

}

export default ReCaptchaConnexion;

// DOM element
if (document.getElementById('recaptcha')) {
    ReactDOM.render(<ReCaptchaConnexion
    />, document.getElementById('recaptcha'));
}